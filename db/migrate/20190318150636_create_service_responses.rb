class CreateServiceResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :service_responses do |t|
      t.references :service_request, foreign_key: true
      t.references :service_provider, foreign_key: true
      t.boolean :accepted
      t.boolean :completed

      t.timestamps
    end
  end
end
