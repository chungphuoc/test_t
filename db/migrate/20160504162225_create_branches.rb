class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.belongs_to :studio
      t.belongs_to :station
      t.timestamps null: false
    end
  end
end
