class AddFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :country_code, :string
    add_column :customers, :business_field, :string
    add_column :customers, :business_type, :string
    add_column :customers, :job_title, :string
    add_column :customers, :telephone, :string
    add_column :customers, :fax, :string
  end
end
