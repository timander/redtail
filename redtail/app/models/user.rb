require "digest/sha1"
 
class User < ActiveRecord::Base
  
  has_many :reservations
  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email

  attr_accessor :password, :confirm_password
 
    def password_is?(pw)
      hashed_password == Digest::SHA1.hexdigest(pw)
    end
 
  # callback hooks
 
    # clean up email before validation
    def before_validation
      self.email = User.clean_string(self.email || "")
    end

    # validate that password and confirm_password match, and that email is proper format
    def validate_on_create
      @email_format = Regexp.new(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/)
      errors.add(:email, "must be a valid format") unless @email_format.match(email)
      errors.add(:confirm_password, "does not match") unless password == confirm_password
      errors.add(:password, "cannot be blank") unless !password or password.length > 0
    end
 
    # hash password before create
    def before_create
      self.hashed_password = User.hash_password(self.password)
    end

    # after creation, clear password from memory
    def after_create
      @password = nil
      @confirm_password = nil
    end

 
  private
 
  # hash password for storage in database
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
 
  # clean string to remove spaces and force lowercase
  def self.clean_string(string)
    (string.downcase).gsub(" ","")
  end

end
