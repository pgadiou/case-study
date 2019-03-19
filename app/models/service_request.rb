class ServiceRequest < ApplicationRecord
  belongs_to :user
  belongs_to :expertise
  has_many :service_responses, dependent: :destroy
end
