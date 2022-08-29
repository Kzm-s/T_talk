class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
      @post = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      if  @post.valid?
          @post.save
          redirect_to root_path
      else
          render :new
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
        redirect_to post_path(@post.id)
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
  def post_params
      params.require(:post).permit(:type, :title, :content, :image, :status).merge(user_id: current_user.id)
  end


end
