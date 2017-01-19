class Initiative < ApplicationRecord
  belongs_to :area

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :area, presence: true
end
