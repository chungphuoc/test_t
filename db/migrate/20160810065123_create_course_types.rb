class CreateCourseTypes < ActiveRecord::Migration
  def change
    create_table :course_types do |t|
    	t.string :name
    	t.belongs_to :studio
      t.timestamps null: false
    end
  end
end
