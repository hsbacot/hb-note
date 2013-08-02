class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @notebooks = current_user.notebooks.all
    @note = Note.new
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
