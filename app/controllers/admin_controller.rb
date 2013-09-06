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

  private
    def admin_params
      params.require(:admin).permit(:username)
    end
end
