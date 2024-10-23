class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    # post_paramsメソッドを使ってパラメータを取得
    @post = current_user.posts.build(post_params)
  
    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:name, :relationship, :virtue_1, :virtue_2, :virtue_3, :virtue_4, :virtue_5, :virtue_6, :virtue_7, :virtue_8, :virtue_9, :virtue_10)
  end
end
