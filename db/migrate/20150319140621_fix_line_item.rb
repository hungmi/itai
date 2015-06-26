class FixLineItem < ActiveRecord::Migration
  def change
  	rename_column :line_items, :Quantity, :quantity
  end
end
