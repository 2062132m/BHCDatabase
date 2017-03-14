class Initiative < ApplicationRecord
  belongs_to :area

  has_many :meetings, :dependent => :destroy
  has_many :enrolments, dependent: :delete_all
  has_many :users, through: :enrolments
  has_many :initiative_funders, dependent: :delete_all

  validates :name, presence: true, length: {maximum: 50}, uniqueness: {:scope => :location, case_sensitive: false}
  validates :description, presence: true, length: {maximum: 255}
  validates :location, presence: true, length: {maximum: 50}
  validates :area, presence: true
  validates :reason_archived, length: {maximum: 30}
end
