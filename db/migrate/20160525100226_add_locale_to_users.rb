class AddLocaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string, default: 'ja'
  end
end
