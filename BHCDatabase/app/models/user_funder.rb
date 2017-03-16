class UserFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :user

  validates_uniqueness_of :funder, :scope => :user
end
