class Order < ApplicationRecord
  belongs_to :user, optional: true
  # belongs_to :product, optional: true #do we need this?
  has_many :carted_products
end
