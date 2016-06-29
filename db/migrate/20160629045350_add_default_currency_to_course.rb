class AddDefaultCurrencyToCourse < ActiveRecord::Migration
  def change
    change_column_default :courses, :currency, 'JPY'
  end
end
