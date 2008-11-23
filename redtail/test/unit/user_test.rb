require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  def test_password
    user = User.new
    user.password = 'secret'
    #assert user.password_is?('secret')
    #assert(user.password != 'secret', 'password should be encrypted')
  end
end
