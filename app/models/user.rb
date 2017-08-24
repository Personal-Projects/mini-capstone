class User < ApplicationRecord
  has_secure_password
  has_many :carted_products #must be above through
  has_many :orders
  has_many :products, through: :carted_products
end
