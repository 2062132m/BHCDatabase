# Initiative is the generic model for an initiative/group
class Initiative < ApplicationRecord
  belongs_to :area

  has_many :meetings, dependent: :destroy
  has_many :enrolments, dependent: :delete_all
  has_many :unenrolments, dependent: :delete_all
  has_many :users, through: :enrolments
  has_many :initiative_funders, dependent: :delete_all
  has_many :funders, through: :initiative_funders
  has_many :removed_initiative_fundings, dependent: :delete_all

  validates :name,
            presence: true,
            length: { maximum: 255 },
            uniqueness: { scope: :location, case_sensitive: false }
  validates :description, presence: true, length: { maximum: 65_536 }
  validates :location, presence: true, length: { maximum: 65_536 }
  validates :area, presence: true
  validates :reason_archived, length: { maximum: 255 }

  def archived?
    archived
  end
end
