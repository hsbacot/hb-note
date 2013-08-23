class BlogController < ApplicationController
  def index
    if User.find_by_username(params[:username]) == nil
      flash[:notice] = "User Does not exist"
      redirect_to root_path
    else
      @user = User.find_by_username(params[:username])
      @notes = @user.notes.where(:public => true)
    end
  end

  def show
  end
end
