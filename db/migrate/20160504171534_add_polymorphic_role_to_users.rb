class AddPolymorphicRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :users, :role_type, :string
    remove_column :studios, :user_id, :integer
    remove_column :customers, :user_id, :integer
  end
end
