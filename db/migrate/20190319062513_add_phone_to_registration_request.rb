class AddPhoneToRegistrationRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :registration_requests, :phone, :integer
  end
end
