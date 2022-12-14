class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(18)
    @notices = Notice.all.order(created_at: :desc)

    #タグ検索
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          post_tags = Tag.find_by(name: key).posts
          post_tags = post_tags.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
          @posts = @posts.empty? ? post_tags : @posts & post_tags
        end
      end
    end
  end


  def new
    @post = Post.new
  end



  def show
    @posts = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
    @comment = Comment.new
    @comments = @post.comments.where(status: :open).order(params[:sort]).includes(:user)
  end

  def edit
    if current_user.id != @post.user.id
      redirect_to root_path
    end
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


  def update
    if @post.valid?
      @post.update(post_params)
      redirect_to root_path
    else
        render :edit
    end
  end

  def destroy
    if @post.destroy
        redirect_to root_path
    end
  end

  def search
    if params[:keyword].present?
      @posts = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
      @posts_search = @posts.where('content LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts_search = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
    end
  end


  def set_post
    @post = Post.find(params[:id])
  end

    private 

    def post_params
        params.require(:post).permit(:type, :title, :content, :image, :status, tag_ids: []).merge(user_id: current_user.id)
    end

    
end
