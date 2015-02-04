class Admin < ActiveRecord::Base
  attr_accessible :alias, :email, :password, :password_confirmation
  has_secure_password

  before_save { |admin| admin.email = email.downcase }
  before_save :create_remember_token

  has_one :role

  validates :alias, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
