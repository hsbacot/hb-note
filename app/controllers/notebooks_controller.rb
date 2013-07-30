class NotebooksController < ApplicationController
  def index
    @notebooks = current_user.notebooks.all
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def new
    @notebook = current_user.notebooks.new
  end

  def edit
    @notebook = current_user.notebooks.find(params[:id])
  end

  def create
    @notebook = current_user.notebooks.new(notebook_params)
    if @notebook.save
      redirect_to @notebook, notice: "Notebook successfully created"
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
