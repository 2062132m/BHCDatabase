class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative

  validates_uniqueness_of :user_id, :scope => :initiative_id
end
