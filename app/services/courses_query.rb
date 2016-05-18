class CoursesQuery
  def initialize(user)
    @user = user
    @result = nil
  end

  def enrollments_statuses(statuses)
    @result = if statuses.empty?
                @user.courses_enrollments
              else
                @user.enrollments.filter(statuses)
              end
  end

  def favourite_courses
    @result = @user.courses_favourites
  end
end
