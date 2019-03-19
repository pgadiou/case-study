class AddSuspendedAndBannedToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :service_providers, :status, :string
  end
end
