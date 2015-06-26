class AddHtmlbgToInformation < ActiveRecord::Migration
  def change
    add_column :information, :html_bg, :string
  end
end
