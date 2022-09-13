class Admin::PostsController < ApplicationController
    before_action :if_not_admin

    def index
        @posts = Post.all
        @comments = @post.comments.includes(:user)

  
      #タグ検索
      if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              post_tags = Tag.find_by(name: key).posts
              @posts = @posts.empty? ? post_tags : @posts & post_tags
            end
          end
      end
  
    end
  
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments.includes(:user)
        
    end
  
    def edit
        @post = Post.find(params[:id])
    end
  
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to admin_post_path(@post.id)
        else
            render :edit
        end
    end
  
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to root_path
        end
    end
  
    private 

    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end
  
    def post_params
        params.require(:post).permit(:type, :title, :content, :image, :status, tag_ids: []).merge(user_id: user.id)
    end


end
