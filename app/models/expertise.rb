class Expertise < ApplicationRecord
  has_many :service_requests, dependent: :destroy
end
