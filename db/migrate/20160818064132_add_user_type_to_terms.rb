class AddUserTypeToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :user_type, :integer, default: 0
  end
end
