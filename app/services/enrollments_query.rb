class EnrollmentQuery
  def initialize(user)
    @user = user
    @result = nil
  end

  def by_course(course)
    @result = Enrollment.find_by_customer_id_and_course_id(@user.role, course.id)
  end
end
