class FixProduct < ActiveRecord::Migration
  def change
  	rename_column :products, :model, :model_name
  end
end
