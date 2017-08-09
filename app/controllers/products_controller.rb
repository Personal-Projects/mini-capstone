class ProductsController < ApplicationController
  def index
    @title = "All Products"
    @products = Product.all
    render "index.html.erb"
  end
  
  def new
    @title = "Make New Product"
    render 'new.html.erb'
  end

  def create
    @title = "Created Product!"
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description]
      )
    product.save
    redirect_to "/products/#{product.id}"
  end

  def show
    @title = "Specific Product"
    url_id = params[:id]
    @product = Product.find_by(id: url_id)
    render "show.html.erb"
  end

  def edit
    @title = "Edit Product Form"
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    #get the correct recipe
    #need the id
    @title = "Updated!"
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    redirect_to "/products/#{product.id}"
  end

  def destroy
    #write some code to delete the thing
    product = Product.find_by(id: params[:id])
    product.destroy
    redirect_to "/products/"
  end

end
