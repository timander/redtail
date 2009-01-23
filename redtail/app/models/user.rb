require "digest/sha1"

class User < ActiveRecord::Base
  has_many :reservations

  attr_accessor :password
  
  validates_presence_of :email, :first_name, :last_name, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/

  before_validation :clean_email
  before_create :encrypt_password

  def password_is?(pw)
    hashed_password == Digest::SHA1.hexdigest(pw)
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  private

  def clean_email
    self.email = email.downcase.gsub(" ", "") if email
  end

  def encrypt_password
    self.hashed_password = User.hash_password(self.password)
  end

  # hash password for storage in database
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
  
end
