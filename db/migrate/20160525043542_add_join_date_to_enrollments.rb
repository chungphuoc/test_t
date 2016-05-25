class AddJoinDateToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :join_date, :date
  end
end
