Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #display a list of all products
  get '/products' => 'products#index'
  
  #return an HTML form for creating a new photo
  get '/products/new' => 'products#new'

  #create a new product
  post '/products' => 'products#create'

  #display a specific product
  get '/products/:id' => 'products#show'

  #return an html form for editing a product
  get '/products/:id/edit' => 'products#edit'
  
  #update a specific product
  patch '/products/:id' => 'products#update'

  #delete a specific product
  delete 'products/:id' => 'products#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
