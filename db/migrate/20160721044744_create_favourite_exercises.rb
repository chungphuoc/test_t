class CreateFavouriteExercises < ActiveRecord::Migration
  def change
    create_table :favourite_exercises do |t|
      t.references :customer
      t.references :exercise

      t.timestamps null: false
    end
  end
end
