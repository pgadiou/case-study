class AddOnlinePaymentToServiceRequest < ActiveRecord::Migration[5.1]
  def change
        add_column :service_requests, :online_payment, :boolean
  end
end
