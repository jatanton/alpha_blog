class User < ActiveRecord::Base
  
  # dependent: :destroy ensures that if we delete a user, all his articles get
  # deleted as well.
  has_many :articles, dependent: :destroy
  
  # before saving to db bs will convert all email to downcase
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
            
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i          
  
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
            
  has_secure_password
  
end
