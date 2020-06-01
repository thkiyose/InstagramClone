class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update,:image_update]

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
  end

  def edit
  end

  def update
    if logged_in? && @user.id == current_user.id
      @user.assign_attributes(user_params)
      if @user.save
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
      @user.assign_attributes(user_params)
      @user.save(validate: false)
      redirect_to user_path(@user.id)
    else
      redirect_to new_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
  
end
