class RenameImageMethodToUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :image, :url
  end
end
