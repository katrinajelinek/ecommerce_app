class RemovePurchaseIdFromCartedProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carted_products, :purchase_id, :integer
  end
end
