class AddFirstNameAndLastNameToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :service_providers, :first_name, :string
    add_column :service_providers, :last_name, :string
  end
end
