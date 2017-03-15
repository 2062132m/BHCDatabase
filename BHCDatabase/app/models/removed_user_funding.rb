class RemovedUserFunding < ApplicationRecord
  belongs_to :funder
  belongs_to :user
end
