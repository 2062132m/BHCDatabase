class Funder < ApplicationRecord
  has_many :initiative_funders
  has_many :medical_conditions_funders
  has_many :user_funders

  validates :name, presence: true, length: {maximum: 50}, uniqueness: { :scope => :email, case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false},
            allow_blank: true
  validates :telephone, length: {maximum: 16}, allow_blank: true
  validates :address, length: {maximum: 255}, allow_blank: true
  validates_format_of :url, :with => URI::regexp(%w(http https)), allow_blank: true
  validates :description, length: {maximum: 255}, allow_blank: true
end
