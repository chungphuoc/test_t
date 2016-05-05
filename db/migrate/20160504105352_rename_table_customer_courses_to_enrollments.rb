class RenameTableCustomerCoursesToEnrollments < ActiveRecord::Migration
  def change
    rename_table :customer_courses, :enrollments
  end
end
