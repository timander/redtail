require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @options = {
      :email => "asdf@asdf.com",
      :password => "password1",
      :confirm_password => "password1",
      :first_name => "First",
      :last_name => "Last",
      :email_confirmed => false
    }
  end

  test "valid" do
    user = User.create(@options)
    assert user.valid?
  end

  test "requires email" do
    @options.delete :email
    user = User.new(@options)
    assert !user.valid?
    assert user.errors.on(:email)
  end

  test "requires valid email" do
    @options[:email] = "bad.email"
    user = User.new(@options)
    assert !user.valid?
    assert user.errors.on(:email)
  end

  test "requires first_name" do
    @options.delete :first_name
    user = User.new(@options)
    assert !user.valid?
    assert user.errors.on(:first_name)
  end

  test "requires last_name" do
    @options.delete :last_name
    user = User.new(@options)
    assert !user.valid?
    assert user.errors.on(:last_name)
  end

  test "requires uniqueness of email" do
    User.create(@options)
    @options[:first_name] = "Another"
    user = User.create(@options)
    assert !user.valid?
    assert_equal "has already been taken", user.errors.on(:email)
  end

  test "confirmation of password" do
    @options[:confirm_password] = "password_doesnt_match"
    user = User.create(@options)
    assert !user.valid?
    assert user.errors.on(:confirm_password)
  end

  test "requires password" do
    @options[:password] = ""
    @options[:confirm_password] = ""
    user = User.create(@options)
    assert !user.valid?
    assert user.errors.on(:password)    
  end

  test "password is not persisted" do
    user = User.create(@options)
    assert_nil user.password
    assert_nil user.confirm_password
    saved_user = User.find(user.id)
    assert_nil saved_user.password
    assert_nil saved_user.confirm_password
  end

  test "cleans email" do
    @options[:email] = "TEST @ TEst. COM"
    user = User.create(@options)
    assert_equal "test@test.com", user.email
  end

  test "hashes password" do
    password_hashed = Digest::SHA1.hexdigest(@options[:password])
    user = User.create(@options)
    assert_equal password_hashed, user.hashed_password
  end

  test "password_is?" do
    password_hashed = Digest::SHA1.hexdigest(@options[:password])
    user = User.create(@options)
    assert user.password_is?(@options[:password])
  end

  test "name" do
    @options[:first_name] = "First"
    @options[:last_name] = "Last"
    user = User.new(@options)
    assert_equal "First Last", user.name
  end

end
