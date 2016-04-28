class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :point
      t.decimal :calo_burnt
      t.integer :gender
      t.date :birthday
      t.boolean :receive_sms
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
