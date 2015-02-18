class User < ActiveRecord::Base
  attr_accessible :name,  :email, :password, :password_confirmation, :avatar
  attr_accessor :password

  has_attached_file :avatar,:styles => { :small => '28x28#', :medium => '48x48#' }

  #has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :encrypt_password

  belongs_to :role

  validates :name,  presence: true, length: { maximum: 50 }
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


  def self.authenticate(email, password)
    find_by_email(email)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
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
