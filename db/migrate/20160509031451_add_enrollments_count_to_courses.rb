class AddEnrollmentsCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :enrollments_count, :integer, default: 0
  end
end
