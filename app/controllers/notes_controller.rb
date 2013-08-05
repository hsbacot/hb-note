class NotesController < ApplicationController

  # user_notebooks = @notebooks = current_user.notebooks.all
  # dont use @notebooks

  def index
    user_notebooks
  end

  def show
    user_notebooks
  end

  def new
    user_notebooks
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @note = current_user.notes.new
  end

  def edit
    user_notebooks
  end

  def create
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to @note, notice: "Note successfully saved"
    else
      redirect_to @note, notice: "There was an error saving your note"
    end
  end

  def update
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:title, :body, :notebook_id, :public)
    end
end
