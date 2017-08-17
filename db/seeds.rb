# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do
#   Product.create(
#     name: Faker::Pokemon.name,
#     location: Faker::Pokemon.location,
#     price: Faker::Commerce.price,
#     description: Faker::Pokemon.move
#   )
# end

# products = Product.all
# products.each do |product|
#   product.supplier_id = 1
#   product.save
# end

# products = Product.all
# suppliers = Supplier.all
# products.each do |product|
#   product.supplier_id = suppliers.sample.id
#   product.save
# end

# # find the supplier of a product
# product = Product.first # => instance of product
# the_supplier_id = product.supplier_id # => an integer
# Supplier.find_by(id: the_supplier_id) # => instance of supplier

products = Product.all
products.each do |product|
  image = Image.new(image: Faker::Avatar.image, product_id: product.id)
  image.save
end







