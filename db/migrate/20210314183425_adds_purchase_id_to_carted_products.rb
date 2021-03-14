class AddsPurchaseIdToCartedProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :carted_products, :purchase_id, :integer
  end
end
