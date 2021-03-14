class Product < ApplicationRecord
  has_many :carted_products
  has_many :purchases, through: :carted_products
end
