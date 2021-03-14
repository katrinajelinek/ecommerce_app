class Purchase < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :purchases, through: :carted_products
end
