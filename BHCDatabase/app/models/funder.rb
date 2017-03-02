class Funder < ApplicationRecord

  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false},
            allow_blank: true

  validates :telephone, length: {maximum: 16}, allow_blank: true

  validates :address, length: {maximum: 50}, allow_blank: true

  validates_format_of :url, :with => URI::regexp(%w(http https)), allow_blank: true

  validates :description, length: {maximum: 255}, allow_blank: true

end
