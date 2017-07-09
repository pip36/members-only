class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :delete]
  before_action :correct_user, only: [:delete]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
   @user = current_user
   @post = @user.posts.new(post_params)
   if @post.save
     redirect_to posts_path
   else
     flash[:error] = "Enter valid input"
     render 'new'
   end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end



private
def post_params
  params.require(:post).permit(:name, :body)
end

def logged_in_user
  unless logged_in?
    flash[:danger] = "please log in"
    redirect_to login_url
  end
end
def correct_user
  @user = User.find_by(params[:id])
  redirect_to root_url unless @user == current_user
end
end
