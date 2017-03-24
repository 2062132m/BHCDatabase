# Funder is the generic model that holds information for a given Funder.
class Funder < ApplicationRecord
  # has_many ... through: allows for the quick querying of Funders. It allows,
  #   for example user.funders to return all the funders for a given user.
  has_many :initiative_funders, dependent: :delete_all
  has_many :initiatives, through: :initiative_funders
  has_many :medical_condition_funders, dependent: :delete_all
  has_many :medical_conditions, through: :medical_condition_funders
  has_many :user_funders, dependent: :delete_all
  has_many :users, through: :user_funders

  validates :name,
            presence: true,
            length: { maximum: 255 },
            uniqueness: { scope: :email, case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false },
            allow_blank: true
  validates :telephone, length: { maximum: 255 }, allow_blank: true
  validates :address, length: { maximum: 255 }, allow_blank: true
  validates :url, length: { maximum: 255 }
  validates_format_of :url, with: URI.regexp(%w(http https)), allow_blank: true
  validates :description, length: { maximum: 65_536 }, allow_blank: true
end
