class EnrollmentsQuery
  def initialize(user)
    @user = user
    @result = nil
  end

  #get enrollments of specific user by statuses
  def by_statuses(statuses)
    @result = if statuses.empty?
                @user.enrollments
              else
                @user.enrollments.where("status IN (?)", statuses)
              end
  end

  def by_course(course)
    @result = Enrollment.find_by_customer_id_and_course_id(@user.role, course.id)
  end

  def calories_burnt(frequency)
    if frequency == 'daily'
      daily_calories_burnt
    elsif frequency == 'weekly'
      weekly_calories_burnt
    else #monthly
      monthly_calories_burnt
    end
  end

  private

  def daily_calories_burnt
    kcal = @user.enrollments.where("join_date = ?", Date.today).inject(0){|sum, e| sum + e.course.kcal}
    return kcal
  end

  def weekly_calories_burnt
    kcal = @user.enrollments.where(join_date: Date.today.beginning_of_week..Date.today).inject(0){|sum, e| sum + e.course.kcal}
    return kcal
  end

  def monthly_calories_burnt
    kcal = @user.enrollments.where(join_date: Date.today.beginning_of_month..Date.today).inject(0){|sum, e| sum + e.course.kcal}
    return kcal
  end
end
