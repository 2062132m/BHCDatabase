class InitiativeFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :initiative

  validates_uniqueness_of :funder, :scope => :initiative
end
