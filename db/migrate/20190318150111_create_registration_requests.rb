class CreateRegistrationRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :status

      t.timestamps
    end
  end
end
