class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @posts = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
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


  def create
    @post = Post.new(post_params)
    # 投稿ボタンを押した場合
    if params[:post]
      if @post.save(context: :publicize)
        redirect_to post_path(@post), notice: "投稿しました！"
      else
        render :new, alert: "投稿できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      if @post.update(status: "hidden")
        redirect_to user_path(current_user), notice: "下書き保存しました！"
      else
        render :new, alert: "保存できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end



  def show
    @post = Post.find(params[:id])
    @posts = Post.where(status: :open).order(params[:sort]).page(params[:page]).per(12)
    @comment = Comment.new
    @comments = @post.comments.where(status: :open).order(params[:sort]).includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
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
        params.require(:post).permit(:type, :title, :content, :image, :status, tag_ids: []).merge(user_id: current_user.id)
    end

    def set_post
        @post = Post.find(params[:id])
    end
    
end
