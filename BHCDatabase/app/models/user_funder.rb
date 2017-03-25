# UserFunder is the intermediary class between a user and its funder.
class UserFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :user

  validates_uniqueness_of :funder_id, scope: :user
end
