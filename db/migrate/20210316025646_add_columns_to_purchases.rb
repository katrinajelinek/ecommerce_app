class AddColumnsToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :status, :integer
    add_column :purchases, :token, :string
    add_column :purchases, :charge_id, :string
    add_column :purchases, :error_message, :string
    add_column :purchases, :customer_id, :string
    add_column :purchases, :payment_gateway, :integer
    rename_column :purchases, :total, :price_cents
  end
end
