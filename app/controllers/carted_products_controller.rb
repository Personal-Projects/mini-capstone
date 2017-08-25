class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    render 'index.html.erb'
  end

  def create
    # carted_product = CartedProduct.where(user_id: current_user.id).where(product_id: params[:id])
    # if carted_product
    #   p '*' * 50
    #   p "This Works!"
    #   p '*' * 50
    #   carted_product.update(
    #     p "THIS WORKS"
    #   )
    # else
      carted_product = CartedProduct.new(
        user_id: current_user.id,
        product_id: params[:input_product_id],
        quantity: params[:input_quantity],
        status: 'carted'
      )
      carted_product.save
    # end

    redirect_to '/carted_products'
  end

  def destroy
    CartedProduct.find_by(id: params[:id]).update(
      status: "removed"
    )
    if CartedProduct.where(user_id: current_user).find_by(status: "carted")
      redirect_to '/carted_products'
    else
      redirect_to '/products'
    end
  end

end
