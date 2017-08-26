class ProductsController < ApplicationController
  def index
    @title = "Pokemon List"
    # if params[:sort_price]
    #   @products = Product.order(:price => params[:sort_price])
    # elsif params[:sort_name]  
    #   @products = Product.order(:name => params[:sort_name])
    # elsif params[:price_category] == 'discounted'
    #   @products = Product.where("price < ?", '15')
    # elsif params[:search_term]
    #   @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
    # else
    #   @products = Product.all
    # end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end

    render "index.html.erb"
  end
  
  def new
    @title = "Create Pokemon"
    render 'new.html.erb'
  end

  def create
    @title = "Creation Complete!"
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    flash[:success] = "You just created a new pokemon!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @title = "Selected Pokemon"
    url_id = params[:id]
    if params[:id] == 'random'
      @product = Product.all.sample
    else
      @product = Product.find_by(id: url_id)
    end
    render "show.html.erb"
    product_quantity = Product.where(quantity: params[:input_quantity])
    # if product_quantity == 0
    #   flash[:danger] = "Please enter a value greater than 0."
    #   redirect_to "show.html.erb"
    # end
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
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    flash[:success] = "You just updated the pokemon!"
    redirect_to "/products/#{@product.id}"
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
