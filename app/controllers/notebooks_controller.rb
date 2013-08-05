class NotebooksController < ApplicationController


  # user_notebooks = @notebooks = current_user.notebooks.all
  # dont use @notebooks

  def index
    user_notebooks
  end

  def show
    user_notebooks
    @notebook = Notebook.find(params[:id])
    @notes = @notebook.notes
  end

  def new
    @notebook = current_user.notebooks.new
    # all notebooks for current user
    user_notebooks
  end

  def edit
    user_notebooks
    @notebook = current_user.notebooks.find(params[:id])
  end

  def create
    @notebook = current_user.notebooks.new(notebook_params)
    if @notebook.save
      redirect_to notebooks_path, notice: "Notebook successfully created"
    else
      redirect_to root_path
    end
  end

  def update
    @notebook = current_user.notebooks.find(params[:id])
    if @notebook.update_attributes(notebook_params)
      redirect_to @notebook, notice: "Notebook successfully updated"
    else
      redirect_to root_path, notice: "Error updating notebook"
    end
  end

  def destroy
    @notebook = current_user.notebooks.find(params[:id])
    @notebook.destroy
  end

  private
    def notebook_params
      params.require(:notebook).permit(:name, :description)
    end
end
