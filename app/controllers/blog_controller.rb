class BlogController < ApplicationController
  def index
    @user = User.find(params[:id])
    @notes = @user.notes.where(:public => true)
  end

  def show
  end
end
