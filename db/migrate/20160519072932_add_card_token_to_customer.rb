class AddCardTokenToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :card_token, :string
  end
end
