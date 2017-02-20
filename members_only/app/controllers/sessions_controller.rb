class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if (user && user.authenticate(params[:session][:password]))
      login(user)
      redirect_to user
    else
    flash.now[:error] = "Invalid Email/Password Combination"
    render 'new'
    end
  end

  def destroy
    logout
  end


end
