require "digest/sha1"

class User < ActiveRecord::Base
  has_many :reservations

  attr_accessor :password
  
  validates_presence_of :email, :first_name, :last_name, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/

  def password_is?(pw)
    hashed_password == Digest::SHA1.hexdigest(pw)
  end
  
  # callback hooks
  
  # clean up email before validation
  def before_validation
    self.email = User.clean_string(self.email || "")
  end

  # hash password before create
  def before_create
    self.hashed_password = User.hash_password(self.password)
  end

  def name
    "#{first_name} #{last_name}"
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
