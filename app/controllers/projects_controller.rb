class ProjectsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @project = Project.new
  end

  def create
    @category = Category.find(params[:category_id])
    @project = @category.projects.new(project_params)
    if @project.save
      flash[:notice] = "'#{@project.name}' add success."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Category add failed"
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project Updated"
      redirect_to category_path(@project.category_id)
    else
      flash[:alert] = "Project update failed"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to category_path(@project.category_id)
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :url)
  end
end
