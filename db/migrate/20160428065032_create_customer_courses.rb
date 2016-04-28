class CreateCustomerCourses < ActiveRecord::Migration
  def change
    create_table :customer_courses do |t|
      t.references :studio, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
