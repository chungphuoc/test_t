class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :cover_img
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
