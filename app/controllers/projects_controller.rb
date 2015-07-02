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
      flash[:error] = "Category add failed"
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :url)
  end
end
