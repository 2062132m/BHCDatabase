class Area < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 255}
  validates :reason_archived, length: {maximum: 30}

  has_many :initiatives, :dependent => :destroy

  def archived?
    archived
  end
end
