class CreateExerciseStudios < ActiveRecord::Migration
  def change
    create_table :exercise_studios do |t|
      t.references :course, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
