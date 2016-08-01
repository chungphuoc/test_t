class Admin::CategoriesController < Admin::BaseController
  def show
    @category = Category.find(params[:id])
    @course_categories = @category.course_categories.page(params[:page])
    # @courses = @category.courses.page(params[:page])
  end
end
