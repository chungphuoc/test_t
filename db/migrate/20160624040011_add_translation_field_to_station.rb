class AddTranslationFieldToStation < ActiveRecord::Migration
  def up
    Station.create_translation_table!({name: :string}, {:migrate_data => true})
  end
 
  def down
    Station.drop_translation_table!
  end
end
