class Api::PurchasesController < ApplicationController
  before_action :authenticate_user

  def index
    @purchase = current_user.purchases
    render "index.json.jb"
  end

  def show
    @purchase = current_user.purchases.find(params[:id])
    render "show.json.jb"
  end

  def create
    carted_products = current_user.carted_products.where(checkout: false)

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @purchase = Purchase.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
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
