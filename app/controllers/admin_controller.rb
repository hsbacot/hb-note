class AdminController < ApplicationController
  # cancan load and auth
  load_and_authorize_resource :class => AdminController


  def index
    @users = User.all
  end

  def user
    @user = User.find_by_username(params[:username])
    @posts = @user.notes.where(:public => true)
  end

  def post
  end

  def update
    @post = Note.find(params[:id])
    @post.publishable = false
    @post.update_column
    redirect_to :back
    flash[:notice] = "User Viewable setting has been changed"
  end

  private
    def admin_params
      params.require(:admin).permit(:username)
    end
end
