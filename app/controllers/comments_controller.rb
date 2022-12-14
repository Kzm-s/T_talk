class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comments = Comment.where(status: :open, post_id: @post).order(params[:sort]).includes(:user)

    if @comment.valid?
      @comment.save
      redirect_to post_path(@post), notice: "コメントしました"
    else
      flash[:danger] = "投稿に失敗しました"
      render template: "posts/show"
    end
  end

    def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end
    
    def update
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      if @comment.valid?
        @comment.update(comment_params)
        redirect_to post_path(@post), notice: "コンテンツを投稿しました"
      else
        flash.now[:danger] = "投稿に失敗しました"
        render 'edit'
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:danger] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end


    
      private
      def comment_params
        params.require(:comment).permit(:comment_content, :status).merge(user_id: current_user.id, post_id: params[:post_id])
      end
end