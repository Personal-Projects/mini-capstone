class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :popularity
      t.string :color

      t.timestamps
    end
  end
end
