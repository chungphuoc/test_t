class CreateCourseStations < ActiveRecord::Migration
  def change
    create_table :course_stations do |t|
    	t.belongs_to :course
    	t.belongs_to :station
    end
    remove_column :courses, :station_id, :integer
  end
end
