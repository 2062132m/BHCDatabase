# ServiceRequest holds the text request of what a user is asking an admin.
class ServiceRequest < ApplicationRecord
  belongs_to :user

  validates :request, presence: true, length: { maximum: 65_536 }
end
