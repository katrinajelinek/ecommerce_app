class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(checkout: false)
    render "index.json"
  end

  # I decided not to write a show function because I don't see a time when a user would want to go to their cart and only see one product in it. If they want to see a product, they'll go to the product details

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      checkout: false,
    )
    if @carted_product.save
      render json: { message: "Added to your cart" }
    else
      render json: { errors: @carted_product.errors.full_messages }
    end
  end

  def destroy
    # In the future, this might want to have a status that changes from carted to removed in order to track what a user has added to their cart in the past
    @carted_product = current_user.carted_products.find(params[:id])
    @carted_product.destroy
    render json: { status: "Product removed from your cart" }
  end
end
