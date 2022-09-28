class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @published_posts = Post.where(user_id: @user.id, status: :open).order(params[:sort]).page(params[:page]).per(12)

        if user_signed_in?
          #current_userが既にルームに参加しているか判断
          @currentUserRoom = UserRoom.where(user_id: current_user.id)
          #他の@userがルームに参加しているか判断
          @receiveUser = UserRoom.where(user_id: @user.id)
        #current_userと@userが一致していなければ
          unless @user.id == current_user.id
              #current_userが参加しているルームを取り出す
              @currentUserRoom.each do |cu|
                  #@userが参加しているルームを取り出す
                  @receiveUser.each do |u|
                  #current_userと@userのルームが同じか判断(既にルームが作られているか)
                    if cu.room_id == u.room_id
                    #falseの時(同じじゃない時)の条件を記述するために変数に代入
                      @haveRoom = true
                    #ルームが共通しているcurrent_userと@userに対して変数を指定
                      @roomId = cu.room_id
                    end
                  end
              end
            #ルームが同じじゃなければ
            unless @haveroom
              #新しいインスタンスを生成
              @room = Room.new
              @userRoom = UserRoom.new
              #//新しいインスタンスを生成
            end
          end
        end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to use_path,success: "プロフィールを更新しました"
      else
        flash.now[:danger] = "プロフィールを更新できませんでした"
      end
    end


    def likes
      @user = User.find(params[:id])
      @likes= Like.where(user_id: @user.id).pluck(:post_id)
      @like_posts = Post.where(id: @likes, status: :open)
      @like_posts_count = @like_posts.size
    end



    def confirms
      @user = User.find(params[:id])
      @confirm_posts = Post.where(user_id: @user.id, status: :hidden).order(params[:sort]).page(params[:page]).per(12)
    end

    def user_params
      params.require(:user).permit(:name, :image, :email, :birth, :gender, :affiliation, :job_title, :career, :responsible, :subject, :grade, :other, :introduction, position_ids: [])
    end

end
