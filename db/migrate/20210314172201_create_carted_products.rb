class CreateCartedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :carted_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :purchase_id
      t.integer :quantity
      t.boolean :checkout

      t.timestamps
    end
  end
end
