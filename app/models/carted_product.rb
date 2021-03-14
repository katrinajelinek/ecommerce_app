class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :purchase, optional: true
end
