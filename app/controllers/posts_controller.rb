class PostsController < ApplicationController

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to @post
    else
      flash[:danger] = "もう一度やり直してください"
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(posts_params)
      flash[:success] = "更新しました"
      redirect_to @post
    else
      flash[:danger] = "もう一度やり直してください"
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:info] = '削除しました'
    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

end
