class Admin::CategoriesController < Admin::BaseController
  def show
    @category = Category.find(params[:id])
    @course_categories = @category.course_categories.page(params[:page])
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
