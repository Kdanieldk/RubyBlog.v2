class PostsController<ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order(:id).page params[:page]
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Successfuly created'
    else
      flash.now[:danger] = 'Article has not been created`'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, succes: 'Successfuly updated '
    else
      render :edit, danger: 'Article hasn`t been updated'
    end
  end

  def destroy
    @status = Post.find(params[:id])
    if @status.present?
      @status.destroy
    end
    redirect_to posts_path, success: 'Succesfuly deleted'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end

end