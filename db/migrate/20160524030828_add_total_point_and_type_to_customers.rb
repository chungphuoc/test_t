class AddTotalPointAndTypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :total_point, :integer, default: 0
    add_column :customers, :customer_type, :integer, default: 0
  end
end
