class AddPhoneToServiceProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :service_providers, :phone, :integer
  end
end
