class ProductsController < ApplicationController
  def product
    @title = "Products"
    @products = Product.all
    render "product.html.erb"
  end

  def show
    # show the user the form
    render 'show.html.erb'
  end

  def make
    #that info is sent through params to another action/url
    product4 = Product.new(name: params[:name], price: params[:price], description: params[:description])
    render 'make_the_product.html.erb'
    product4.save
  end
end
