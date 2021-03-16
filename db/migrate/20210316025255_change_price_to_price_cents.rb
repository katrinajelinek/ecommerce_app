class ChangePriceToPriceCents < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :price, :price_cents
  end
end
