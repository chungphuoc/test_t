class CreateFavouriteClasses < ActiveRecord::Migration
  def change
    create_table :favourite_classes do |t|
      t.references :customer
      t.references :course

      t.timestamps null: false
    end
  end
end
