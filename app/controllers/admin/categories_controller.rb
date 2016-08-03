class Admin::CategoriesController < Admin::BaseController
  def show
    @category = Category.find(params[:id])
    @course_categories = @category.course_categories.page(params[:page])
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category
      @category.destroy
    end
    redirect_to admin_categories_path
  end

  def default
    Category.create_default
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
