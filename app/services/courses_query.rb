class CoursesQuery
  def initialize(user)
    @user = user
    @result = nil
  end

  # get course by enrollment status
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

  def courses_by_date(date)
    wday = date.wday
    @courses = @user.courses.where("#{wday} = ANY (days_of_week)")
  end

  def join_dates_json
    days = @user.courses.select(:days_of_week).inject([]) { |r, o| r + o[:days_of_week] }
    days = days + days.collect{|d| d + 7}
    newdays = days.collect do |day|
      newday = Date.today.beginning_of_week + (day - 1).days
      if Date.today.wday < day
        newday.strftime("%Y-%m-%d")
      end
    end
    result = newdays.compact.inject(Hash.new(0)) { |total, d| total[d] += 1; total }
    result.to_json
  end
end
