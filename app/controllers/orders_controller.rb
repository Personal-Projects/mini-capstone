class OrdersController < ApplicationController
  def show
    @order_products = CartedProduct.where(order_id: params[:id])
    render "show.html.erb"
  end

  def create
    carted_products = CartedProduct.where(user_id: current_user).where(status: "carted")
    sum = 0
    subtotal = 0
    tax_rate = 0.09
    tax = 0
    total = 0
    carted_products.each do |carted_product|
      sum += carted_product.product.price * carted_product.quantity
      subtotal = sum
      tax = tax_rate * subtotal
      total = subtotal + tax
    end
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    order.save
    p order
    carted_products.each do |carted_product|
      carted_product.update(
        order_id: order.id,
        status: "purchased",
      )
    end
    flash[:success] = "Your order has been received!"
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