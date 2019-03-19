class AddExpertiseToServiceRequest < ActiveRecord::Migration[5.1]
  def change
    add_reference :service_requests, :expertise, foreign_key: true
  end
end
