class AddDetailsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :location, :string
    remove_column :products, :image, :string
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
