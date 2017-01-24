class Initiative < ApplicationRecord
  belongs_to :area
  has_many :meetings

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :area, presence: true
end
