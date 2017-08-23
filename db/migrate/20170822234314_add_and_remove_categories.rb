class AddAndRemoveCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :popularity, :string
    add_column :categories, :size, :string
    add_column :categories, :kind, :string
  end
end
