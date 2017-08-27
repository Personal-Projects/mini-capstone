class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :password, length: {in: 6..20}
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :carted_products #must be above through
  has_many :orders
  has_many :products, through: :carted_products
end
