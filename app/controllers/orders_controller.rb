class OrdersController < ApplicationController
  def create
    # @product = Product.find_by(id: params[:product_id])
    # @subtotal = params[:quantity].to_i * @product.price
    # @tax = subtotal * product.tax
    # @total = subtotal + tax
    @order1 = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id]
      # tax: tax,
      # subtotal: subtotal,
      # total: total
    )
    @order1.save
    redirect_to "/orders/#{@order1.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    p @order
    render 'show.html.erb'
  end
end
