class Admin < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  belongs_to :role

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password_confirmation, presence: true



  def self.authenticate(email, password)
    admin = find_by_email(email)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
