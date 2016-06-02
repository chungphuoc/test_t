class AddDefaultValueToCustomersPoint < ActiveRecord::Migration
  def change
    change_column_default :customers, :point, 0
  end
end
