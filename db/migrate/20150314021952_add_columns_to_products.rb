class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :model, :string
    add_column :products, :item_number, :string
    add_column :products, :part_number, :string
    add_column :products, :diameter, :string
    add_column :products, :size, :string
  end
end
