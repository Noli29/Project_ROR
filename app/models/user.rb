class User < ActiveRecord::Base

  #include Authenticate

  attr_accessible :name, :surname,  :email, :password,  :password_confirmation
  attr_accessor :password, :password_confirmation
  has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" },
                    :default_url => "/assets/missing_avatar.png"


  before_save { |user| user.email = email.downcase }
  before_save :encrypt_password

  belongs_to :role

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX }
          #  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true
  #validates_attachment :avatar,
#                       :presence => true,
 #                      :size => { :in => 0..10.megabytes },
#                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/}



  def admin?
    self.role == "super_admin"
  end

  def role?(role)
    self.role == role
  end

  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end

  def self.authenticate(email, password)
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
