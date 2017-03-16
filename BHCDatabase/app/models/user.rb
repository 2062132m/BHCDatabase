class User < ApplicationRecord
  enum aims: [:improve_health, :have_a_healthier_lifestyle, :have_more_confidence, :make_new_friends, :be_happier,
              :lost_weight, :increase_physical_activities, :be_able_to_overcome_problems_better, :learn_new_things,
              :be_more_able_to_self_manage_condition, :be_better_able_to_build_relationships, :be_more_involved_in_the_community,
              :cope_better_with_caring_responsibilities, :reduce_levels_of_medication, :other]

  has_many :enrolments, dependent: :delete_all
  has_many :unenrolments, dependent: :delete_all
  has_many :initiatives, through: :enrolments
  has_many :attendances, dependent: :delete_all
  has_many :meetings, through: :attendances
  has_many :conditions, dependent: :delete_all
  has_many :unassigned_conditions, dependent: :delete_all
  has_many :medical_conditions, through: :conditions
  has_many :feedbacks, dependent: :delete_all
  has_many :answers, through: :feedbacks
  has_many :user_funders, dependent: :delete_all
  has_many :removed_user_fundings, dependent: :delete_all

  before_save { self.email = email.downcase }

  validates :forename,
            presence: true,
            length: {maximum: 50},
            uniqueness: {:scope => [:dob, :email, :telephone], case_sensitive: false}
  validates :surname,
            presence: true,
            length: {maximum: 50}
  validates :known_as, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, :if => :password_validation_required?
  validates :telephone, presence: true, length: {maximum: 16}
  validates :dob, presence: true
  validates :privilege, presence: true, numericality: {only_integer: true,
                                                       greater_than_or_equal_to: 0,
                                                       less_than_or_equal_to: 2}
  validates :emergency_telephone, presence: true, length: {maximum: 16}, :unless => :is_admin?
  validates :emergency_name, presence: true, length: {maximum: 50}, :unless => :is_admin?
  validates :reason_archived, length: {maximum: 30}
  validates :address1, length: {maximum: 255}, presence: true
  validates :address2, length: {maximum: 255}
  validates :town, length: {maximum: 50}, presence: true
  validates :postcode, length: {maximum: 10}, presence: true
  validates :aims, presence: true, inclusion: {:in => aims.keys}, :unless => :is_admin?
  validates :aims_other, length: {maximum: 255}, :unless => :is_admin?
  validates :prevent_attending, length: {maximum: 255}, :unless => :is_admin?
  validates :reg_date, presence: true
  validate :only_service_user_has_feedback
  validate :dob_before_today
  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def password_validation_required?
    password_digest.blank? || !password.blank?
  end

  def dob_before_today
    errors.add(:dob, 'DOB is today or in the future') if dob.present? && dob >= Date.today
  end

  def only_service_user_has_feedback
    errors.add(:feedback_due, "A non service user can't have a feedback due") if privilege != 2 && feedback_due.present?
    errors.add(:feedback_due, 'A service user must have a feedback') if privilege == 2 && !feedback_due.present?
  end

  def is_admin?
    privilege == 0
  end
end
