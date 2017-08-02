class ProductsController < ApplicationController
  def product
    @title = "Products"
    @products = Product.all
    render "product.html.erb"
  end
end
