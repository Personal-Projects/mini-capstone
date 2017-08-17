class RemoveSupplierId < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :supplier_id, :integer
  end
end
