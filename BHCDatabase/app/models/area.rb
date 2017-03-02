class Area < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :archived, presence: true
  validates :reason_archived, length: {maximum: 30}
  has_many :initiatives, :dependent => :destroy
end
