class Meeting < ApplicationRecord
  belongs_to :initiative

  has_many :attendances, dependent: :delete_all
  has_many :users, through: :attendances

  validates :datetime, presence: true
  validates :initiative_id, presence: true, uniqueness: {:scope => :datetime}

end
