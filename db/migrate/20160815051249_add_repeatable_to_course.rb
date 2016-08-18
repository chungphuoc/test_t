class AddRepeatableToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :repeatable, :boolean, default: false
  end
end
