class Unenrolment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative
end
