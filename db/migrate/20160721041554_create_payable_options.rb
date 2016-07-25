class CreatePayableOptions < ActiveRecord::Migration
  def change
    create_table :payable_options do |t|
    	t.string :name
    	t.integer :price
    	t.string :currency, default: 'JPY'
    	t.belongs_to :studio 
      t.timestamps null: false
    end
  end
end
