class RemoveCaloAndAttendedCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :calo_burnt, :decimal
    remove_column :customers, :total_attended, :integer
    remove_column :customers, :customer_type, :integer
  end
end
