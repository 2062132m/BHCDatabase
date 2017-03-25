# Area is the generic model for an area. An area is crucial to many features
#   of the website.
class Area < ApplicationRecord
  has_many :initiatives, dependent: :destroy

  validates :name,
            presence: true,
            length: { maximum: 255 },
            uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 65_536 }
  validates :reason_archived, length: { maximum: 255 }

  def archived?
    archived
  end
end
