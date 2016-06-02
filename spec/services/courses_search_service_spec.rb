require 'rails_helper'

RSpec.describe CoursesSearchService, type: :service do
  let!(:course_1) { create(:course) }
  let!(:course_2) { create(:course) }
  let!(:course_3) { create(:course) }

  it 'Search all courses' do
    expect(CoursesSearchService.new.execute.sort).to eq([course_1, course_2, course_3])
  end

  it 'Search courses by exercise_ids' do
    expect(CoursesSearchService.new(exercise_ids: [course_1.exercise_id, course_2.exercise_id, course_3.exercise_id]).execute).to eq([course_1, course_2, course_3])
  end

  it 'Search courses by station_ids' do
    expect(CoursesSearchService.new(station_ids: [course_1.station_id, course_2.station_id, course_3.station_id]).execute).to eq([course_1, course_2, course_3])
  end

  context 'Search courses by exercise_ids and station_ids' do
    it 'With results' do
      expect(CoursesSearchService.new(station_ids: [course_1.station_id], exercise_ids: [course_1.exercise_id]).execute).to eq([course_1])
    end
    it 'With no results' do
      expect(CoursesSearchService.new(station_ids: [course_1.station_id], exercise_ids: [course_2.exercise_id]).execute).to eq([])
    end
  end

  context 'Search courses by date' do
    context 'In date class is full' do
      before { course_1.update(full_dates: [Date.current]) }
      it { expect(CoursesSearchService.new(date: Date.current).execute).not_to include(course_1) }
    end
    context 'In date class is not full' do
      before { course_1.update(full_dates: [10.days.ago]) }
      it { expect(CoursesSearchService.new(date: Date.current).execute).to include(course_1) }
    end
  end

  context 'Search courses by exercise_ids and date' do
    context 'In date class is full' do
      before { course_1.update(full_dates: [Date.current]) }
      it { expect(CoursesSearchService.new(exercise_ids: [course_1.exercise_id, course_2.exercise_id], date: Date.current).execute).not_to include(course_1) }
    end
    context 'In date class is not full' do
      before { course_1.update(full_dates: [10.days.ago]) }
      it { expect(CoursesSearchService.new(exercise_ids: [course_1.exercise_id, course_2.exercise_id], date: Date.current).execute).to include(course_1) }
    end
  end

  context 'Search courses by station_ids and date' do
    context 'In date class is full' do
      before { course_1.update(full_dates: [Date.current]) }
      it { expect(CoursesSearchService.new(exercise_ids: [course_1.exercise_id, course_2.exercise_id], station_ids: [course_1.station_id, course_2.station_id], date: Date.current).execute).not_to include(course_1) }
    end
    context 'In date class is not full' do
      before { course_1.update(full_dates: [10.days.ago]) }
      it { expect(CoursesSearchService.new(exercise_ids: [course_1.exercise_id, course_2.exercise_id], station_ids: [course_1.station_id, course_2.station_id], date: Date.current).execute).to include(course_1) }
    end
  end

  context 'Search courses by exercise_ids, station_ids and date' do
    context 'In date class is full' do
      before { course_1.update(full_dates: [Date.current]) }
      it { expect(CoursesSearchService.new(station_ids: [course_1.station_id, course_2.station_id], date: Date.current).execute).not_to include(course_1) }
    end
    context 'In date class is not full' do
      before { course_1.update(full_dates: [10.days.ago]) }
      it { expect(CoursesSearchService.new(station_ids: [course_1.station_id, course_2.station_id], date: Date.current).execute).to include(course_1) }
    end
  end
end