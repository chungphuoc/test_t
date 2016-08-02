class CreateBackgroundImages < ActiveRecord::Migration
  def change
    create_table :background_images do |t|
      t.string :url
      t.integer :img_type, default: 0

      t.timestamps null: false
    end
  end
end
