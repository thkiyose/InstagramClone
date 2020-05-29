class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if logged_in? && @user.id == current_user.id
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    else
      redirect_to new_session_path
    end
  end

  def image_update
    if logged_in? && current_user.id.to_s == params[:id]
      @user = User.find_by(id: params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to new_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
