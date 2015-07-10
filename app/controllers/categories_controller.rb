class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "'#{@category.name}' add success."
      redirect_to categories_path
    else
      flash[:alert] = "Category add failed"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category Updated"
      redirect_to categories_path
    else
      flash[:alert] = "Category update failed"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category Deleted"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
