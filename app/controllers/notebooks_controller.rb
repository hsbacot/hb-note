class NotebooksController < ApplicationController
  def index
    @notebooks = current_user.notebooks.all
  end

  def show
  end

  def new
    @notebook = current_user.notebooks.new
  end

  def edit
  end

  def create

  end

  def update
  end

  def destroy
  end
end
