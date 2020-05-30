class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました"
      else
      render :new
      end
    end
  end

  def show
    @post = Post.find_by(id:params[:id])
  end

  def edit
    @post = Post.find_by(id:params[:id])
    unless logged_in? && @post.user.id == current_user.id
      redirect_to new_session_path
    end
  end

  def update
    @post = Post.find_by(id:params[:id])
    unless logged_in? && @post.user.id == current_user.id
      redirect_to new_session_path
    end
    if @post.update(post_params)
      redirect_to post_path(@post.id)
      flash[:notice] = "投稿を編集しました"
    else
      render :edit
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    unless logged_in? && @post.user.id == current_user.id
      redirect_to new_session_path
    end
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "投稿を削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:content,:image,:image_cache).merge(user_id:current_user.id)
  end
end
