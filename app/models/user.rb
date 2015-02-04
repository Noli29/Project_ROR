class User < ActiveRecord::Base
  attr_accessible :name, :surname, :email, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  has_one :role

  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true


  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
