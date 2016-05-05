class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :studio
      t.belongs_to :exercise
      t.timestamps null: false
    end
  end
end
