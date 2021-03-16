class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :paypal_plan_name, :string
    add_column :products, :price_currency, :string, default: "USD", null: false
  end
end
