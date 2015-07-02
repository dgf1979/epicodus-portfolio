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
      flash[:error] = "Category add failed"
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
