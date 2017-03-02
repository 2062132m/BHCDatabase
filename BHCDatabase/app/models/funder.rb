class Funder < ApplicationRecord

  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :telephone, length: {maximum: 16}

  validates :address, length: {maximum: 50}

  validates_format_of :url, :with => URI::regexp(%w(http https))

  validates :description, length: {maximum: 255}

end
