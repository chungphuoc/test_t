class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :cover_img
      t.string :address
      t.string :phone_number
      t.string :website
      t.text :description
      t.decimal :rating
      t.decimal :kcal
      t.integer :num_slot
      t.time :start_time
      t.time :end_time
      t.date :start_day

      t.timestamps null: false
    end
  end
end
