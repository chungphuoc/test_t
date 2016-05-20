class AddTuitionCurrencyBookedSlotToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :tuition, :integer
    add_column :courses, :currency, :string
    add_column :courses, :booked_slot, :integer
  end
end
