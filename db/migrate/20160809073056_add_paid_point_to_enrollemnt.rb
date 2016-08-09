class AddPaidPointToEnrollemnt < ActiveRecord::Migration
  def change
  	add_column :enrollments, :paid_points, :integer
  end
end
