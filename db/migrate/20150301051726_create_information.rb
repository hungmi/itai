class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :about
      t.string :company_skype
      t.string :address
      t.string :telephone
      t.string :fax
      t.string :mail_address

      t.timestamps
    end
  end
end
