class Personal::FavouriteClassesController < Personal::BaseController

  def create_favourite
    @course_id = params[:course_id]
    current_user.favourite_classes.create(course_id: params[:course_id])
  end

  def delete_favourite
    @favouriteClass = FavouriteClass.find_by_customer_id_and_course_id(params[:customer_id], params[:course_id])
    if @favouriteClass
      @course_id = params[:course_id]
      @favouriteClass.destroy
    end
  end
end
