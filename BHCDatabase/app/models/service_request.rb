class ServiceRequest < ApplicationRecord
  belongs_to :user
  validates :request, presence: true, length: {maximum: 65536}
end
