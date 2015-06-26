class RemoveCategoryidFromBrand < ActiveRecord::Migration
  def change
    remove_column :brands, :category_id, :integer
  end
end
