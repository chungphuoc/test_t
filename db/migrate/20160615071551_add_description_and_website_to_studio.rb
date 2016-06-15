class AddDescriptionAndWebsiteToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :description, :text
    add_column :studios, :website, :string
  end
end
