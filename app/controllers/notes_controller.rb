class NotesController < ApplicationController

  layout "with_notebooks"
  
  # user_notebooks = @notebooks = current_user.notebooks.all
  # dont use @notebooks

  def index
    user_notebooks
  end

  def show
    user_notebooks
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @note = Note.find(params[:id])
  end

  def new
    user_notebooks
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @note = Note.new
  end

  def edit
    user_notebooks
    @notebook = current_user.notebooks.find(params[:id])
    @note = Note.find(params[:id])
  end

  def create
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @note = current_user.notes.new(note_params)
    @note.notebook_id = params[:notebook_id]
    if @note.save
      redirect_to notebook_path(@notebook), notice: "Note successfully saved"
    else
      redirect_to notebook_path(@notebook), notice: "There was an error saving your note"
    end
  end

  def update
    @notebook = current_user.notebooks.find(params[:id])
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      redirect_to notebook_note_path(@notebook, @note), notice: "Note successfully updated"
    else
      redirect_to notebook_note_path(@notebook, @note), notice: "There was an error updating your note"
    end
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:title, :body, :notebook_id, :public)
    end
end
