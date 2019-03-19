class AddInvestigatedToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :investigated, :string
  end
end
