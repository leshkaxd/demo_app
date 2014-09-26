class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w\+\-\.]+@[\w\-]+(\.\w+)*\.\w+\z/i

  has_secure_password

  before_save { self.email.downcase! }

  validates :name,  presence: true, 
                    length: { maximum: 50 }
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end