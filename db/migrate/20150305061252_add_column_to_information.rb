class AddColumnToInformation < ActiveRecord::Migration
  def change
    add_column :information, :JumbotronTitle, :text
    add_column :information, :JumbotronSubtitle, :text
    add_column :information, :JumbotronImg, :string
  end
end
