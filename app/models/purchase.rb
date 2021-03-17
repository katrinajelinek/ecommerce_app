class Purchase < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  # enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3 }
  # enum payment_gateway: { stripe: 0, paypal: 1 }

  # scope :recently_created, -> { where(created_at: 1.minutes.ago..DateTime.now) }

  # def set_paid
  #   self.status = Purchase.statuses[:paid]
  # end

  # def set_failed
  #   self.status = Purchase.statuses[:failed]
  # end

  # def set_paypal_executed
  #   self.status = Purchase.statuses[:paypal_executed]
  # end
end
