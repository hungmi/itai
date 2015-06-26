class CreateInquirylists < ActiveRecord::Migration
  def change
    create_table :inquirylists do |t|

      t.timestamps
    end
  end
end
