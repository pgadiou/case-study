class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :service_response, foreign_key: true

      t.timestamps
    end
  end
end
