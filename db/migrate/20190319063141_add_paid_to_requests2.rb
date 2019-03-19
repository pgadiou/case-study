class AddPaidToRequests2 < ActiveRecord::Migration[5.1]
  def change
    add_column :service_requests, :paid, :boolean
  end
end
