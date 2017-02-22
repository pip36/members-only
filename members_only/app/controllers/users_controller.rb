class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :delete]
before_action :correct_user, only: [:edit, :update, :delete]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New Account Successfully Created"
      login(@user)
      remember(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "please log in"
      redirect_to login_url
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
