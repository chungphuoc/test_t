class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.belongs_to :studio
      t.belongs_to :teacher
      t.timestamps null: false
    end
  end
end
