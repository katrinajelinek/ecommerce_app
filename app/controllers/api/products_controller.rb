class Api::ProductsController < ApplicationController
  def index
    @products = Product.limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(
      name: params[:name],
      price_cents: params[:price_cents],
      description: params[:description],
      inventory: params[:inventory],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price_cents = params[:price_cents] || @product.price_cents
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: { message: "This product has been deleted" }
  end
end
