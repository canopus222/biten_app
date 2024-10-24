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
      redirect_to posts_path, notice: "美点が作成されました。"
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user  # 現在のユーザーが投稿者かどうか確認
      @post.destroy
      redirect_to posts_path, notice: '投稿が削除されました。'  # 投稿一覧へリダイレクト
    else
      redirect_to posts_path, alert: '削除できませんでした。'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :relationship, :virtue_1, :virtue_2, :virtue_3, :virtue_4, :virtue_5, :virtue_6, :virtue_7, :virtue_8, :virtue_9, :virtue_10)
  end
end
