class Area < ApplicationRecord
  validates :name, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 65536}
  validates :reason_archived, length: {maximum: 255}

  has_many :initiatives, :dependent => :destroy

  def archived?
    archived
  end
end
