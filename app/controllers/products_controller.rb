class ProductsController < ApplicationController
  def index
    @title = "Pokemon List"
    @products = Product.all
    render "index.html.erb"
  end
  
  def new
    @title = "Create Pokemon"
    render 'new.html.erb'
  end

  def create
    @title = "Creation Complete!"
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description]
      )
    product.save
    flash[:success] = "You just created a new pokemon!"
    redirect_to "/products/#{product.id}"
  end

  def show
    @title = "Selected Pokemon"
    url_id = params[:id]
    @product = Product.find_by(id: url_id)
    render "show.html.erb"
  end

  def edit
    @title = "Edit Pokemon"
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    #get the correct recipe
    #need the id
    @title = "Update Complete!"
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    flash[:info] = "You just updated the pokemon!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    #write some code to delete the thing
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "You just deleted the pokemon!"
    flash[:info] = "You now have #{Product.count} pokemons left in your collection."
    redirect_to "/products/"
  end

end
