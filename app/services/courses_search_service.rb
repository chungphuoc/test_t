class CoursesSearchService
  def initialize(params = {})
    @params = params
  end

  def execute
    results = Course.search(search_params)
    results = results.available(@params[:date]) if @params[:date].present?
    results
  end

  private

  def search_params
    @params.slice(:station_ids, :exercise_ids)
  end
end