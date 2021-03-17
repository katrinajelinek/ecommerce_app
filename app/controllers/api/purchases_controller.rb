class Api::PurchasesController < ApplicationController
  before_action :authenticate_user

  def index
    @purchase = current_user.purchases

    # Paypal tutorial code https://www.toptal.com/ruby-on-rails/ruby-on-rails-ecommerce-tutorial
    # products = Product.all
    # @products_purchase = products.where(stripe_plan_name: nil, paypal_plan_name: nil)
    # @products_subscription = products - @products_purchase
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
  end

  def create
    carted_products = current_user.carted_products.where(checkout: false)

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price_cents * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @purchase = Purchase.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      price_cents: calculated_total,
    )

    if @purchase.save
      carted_products.update_all(purchase_id: @purchase.id, checkout: true)
      carted_products.map do |carted_product|
        carted_product.product.update(inventory: (carted_product.product.inventory - carted_product.quantity))
      end
      render "show.json.jb"
    else
      render json: { errors: @purchases.errors.full_messages }
    end
  end

  #I decided not to make a destroy action because a user should be able to see past purchases
end
