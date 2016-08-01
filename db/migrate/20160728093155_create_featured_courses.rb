class CreateFeaturedCourses < ActiveRecord::Migration
  def change
    create_table :featured_courses do |t|
      t.references :course

      t.timestamps null: false
    end
  end
end
