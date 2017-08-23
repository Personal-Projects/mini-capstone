class RemoveCategoriesAddName < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :size, :string
    remove_column :categories, :kind, :string
    remove_column :categories, :color, :string
    add_column :categories, :name, :string
  end
end
