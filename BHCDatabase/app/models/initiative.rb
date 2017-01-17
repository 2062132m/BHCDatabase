class Initiative < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
end
