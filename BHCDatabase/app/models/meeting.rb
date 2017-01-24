class Meeting < ApplicationRecord
  belongs_to :initiative

  validates :datetime, presence: true
end
