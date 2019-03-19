class ServiceResponse < ApplicationRecord
  belongs_to :service_request
  belongs_to :service_provider
  has_many :reviews, dependent: :destroy
end
