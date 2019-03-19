class AddExpertiseToServiceProvider < ActiveRecord::Migration[5.1]
  def change
    add_reference :service_providers, :expertise, foreign_key: true
  end
end
