class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
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
              @UserRoom = UserRoom.new
              #//新しいインスタンスを生成
            end
          end
    end


end
