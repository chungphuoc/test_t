class AddPaymentInfoToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :payment_infos, :text
  end
end
