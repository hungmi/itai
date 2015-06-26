class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :category_id
      t.text :tags
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
