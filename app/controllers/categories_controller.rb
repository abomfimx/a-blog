class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    redirect_to categories_path, alert: 'Only admins can perform that action' unless logged_in? && current_user.admin?
  end
end
