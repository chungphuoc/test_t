class AddTotalAttendedToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :total_attended, :integer, default: 0
  end
end
