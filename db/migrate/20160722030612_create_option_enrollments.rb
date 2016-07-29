class CreateOptionEnrollments < ActiveRecord::Migration
  def change
    create_table :option_enrollments do |t|
    	t.belongs_to :option, class_name: 'PayableOption', index: true
    	t.belongs_to :enrollment, index: true
      t.timestamps null: false
    end
  end
end
