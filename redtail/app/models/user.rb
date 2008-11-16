require "digest/sha1"
 
class User < ActiveRecord::Base
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 4

  attr_accessor :password, :confirm_password
 
  # callback hooks
 
    # clean up email and username before validation
    def before_validation
      self.email = User.clean_string(self.email || "")
      self.username = User.clean_string(self.username || "")
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
