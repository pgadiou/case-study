class CreateServiceRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :service_requests do |t|
      t.string :location
      t.string :description
      t.integer :time_to_answer
      t.integer :price
      t.boolean :answered
      t.boolean :completed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
