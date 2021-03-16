class Product < ApplicationRecord
  monetize :price_cents
  has_many :carted_products
  has_many :purchases, through: :carted_products
end
