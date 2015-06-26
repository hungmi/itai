class AddQuantityToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :Quantity, :integer
  end
end
