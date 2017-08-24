class CartedProductsController < ApplicationController
  def index
    #only to show carted_products of the current user
    #only show carted_products with status of carted
    #carted products purchased or removed should not appear
    render 'index.html.erb'
  end

  def create
    added_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity],
      status: 'carted'
    )
    added_product.save

    redirect_to "/carted_products"
  end


end
