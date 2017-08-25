class OrdersController < ApplicationController
  def show
    @order_products = CartedProduct.where(order_id: params[:id])
    render "show.html.erb"
  end

  def create
    subtotal = 0
    carted_products = CartedProduct.where(user_id: current_user).where(status: "carted")
    carted_products.each do |carted_product|
      subtotal = carted_product.product.price * carted_product.quantity
    end
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax:  subtotal * 0.09,
      total: subtotal * 1.09
    )
    order.save
    carted_products.each do |carted_product|
      carted_product.update(
        status: "purchased",
        order_id: order.id
      )
    end

    redirect_to "/orders/#{order.id}"
  end

  # def create
  #   product = Product.find_by(id: params[:input_product_id])
  #   subtotal = params[:input_quantity].to_i * product.price
  #   tax = subtotal * product.tax
  #   total = subtotal + tax
  #   order1 = Order.new(
  #     user_id: current_user.id,
  #     quantity: params[:input_quantity],
  #     product_id: params[:input_product_id],
  #     tax: tax,
  #     subtotal: subtotal,
  #     total: total
  #   )
  #   order1.save
  #   redirect_to "/orders/#{order1.id}"
  # end

end