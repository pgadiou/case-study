class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.references :user, foreign_key: true
      t.integer :card_number

      t.timestamps
    end
  end
end
