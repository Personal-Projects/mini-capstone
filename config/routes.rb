Rails.application.routes.draw do
  get '/product' => 'products#product'
  get '/new_product' => 'products#show'
  post '/make_the_product' => 'products#make'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
