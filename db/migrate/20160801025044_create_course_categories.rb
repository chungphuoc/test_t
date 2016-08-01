class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.references :category
      t.references :course

      t.timestamps null: false
    end
  end
end
