class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total

      t.timestamps
    end
  end
end
