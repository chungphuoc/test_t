class CoursesSearchService
  def initialize(params = {})
    @params = params
  end

  def execute
    results = Course.search(search_params)
    results = results.available(@params[:date]) if @params[:date].present?
    results.where(status: Course.statuses[:active])
  end

  private

  def search_params
    @params.slice(:station_ids, :exercise_ids, :max_kcal, :min_kcal, :min_time, :max_time)
  end
end
