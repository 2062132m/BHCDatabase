class Meeting < ApplicationRecord
  belongs_to :initiative

  validates :datetime, presence: true
  validates :initiative_id, presence: true
end
