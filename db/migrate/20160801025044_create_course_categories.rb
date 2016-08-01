class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.references :category
      t.references :course

      t.timestamps null: false
    end
    add_index :course_categories, :category_id
    add_index :course_categories, :course_id
    add_index :course_categories, [:category_id, :course_id]
  end
end
