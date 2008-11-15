require 'digest/md5'

class User < ActiveRecord::Base

    validates_presence_of :username
    validates_uniqueness_of :username
    validates_confirmation_of :password

    attr_reader :password

    def password=(pw)
      puts pw
      @password = Digest::MD5.hexdigest(pw)
    end

    def password_is?(pw)
      Digest::MD5.hexdigest(pw) == password
    end

    def password_confirmation=(cf)
      puts cf
      password=(cf)
    end
end
