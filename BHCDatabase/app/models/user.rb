class User < ApplicationRecord

  has_many :enrolments
  has_many :initiatives, through: :enrolments

  has_many :attendances
  has_many :meetings, through: :attendances

  has_many :conditions
  has_many :medical_conditions, through: :conditions

  has_many :feedbacks
  has_many :answers, through: :feedbacks

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates :telephone, presence: true, length: {maximum: 16}

  validates :dob, presence: true

  validate :dob_before_today

  validate :only_service_user_has_feedback

  validates :privilege, presence: true, numericality: {only_integer: true,
                                                       greater_than_or_equal_to: 0,
                                                       less_than_or_equal_to: 2}

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def dob_before_today
    if dob.present? && dob >= Date.today
      errors.add(:dob, 'DOB is today or in the future')
    end
  end

  def only_service_user_has_feedback

    if privilege == 2
      unless feedback_due.present?
        errors.add(:feedback_due, 'A service user must have a feedback')
      end
    else
      if feedback_due.present?
        errors.add(:feedback_due, "A non service user can't have a feedback due")
      end
    end

  end
end
