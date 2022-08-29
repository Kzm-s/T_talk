class CommentsController < ApplicationController

    def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    
    def update
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to post_path(@post), notice: "コンテンツを投稿しました"
      else
        flash.now[:danger] = "投稿に失敗しました"
        render 'edit'
      end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:danger] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end
    
      private
      def comment_params
        params.require(:comment).permit(:comment_content, :status).merge(post_id: params[:post_id])
      end
end
