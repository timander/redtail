require "digest/sha1"
 
class MainController < ApplicationController
 
  # the root index action for our application
  def index
  end

  def login
    if request.post?
      puts 'got in login post'
    else
      puts 'got in login get'
    end
  end
  
  # allows guests to create a new User
  def register

    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])

      if @user.save
        flash[:notice] = "Thank you for registering! We have sent a confirmation email to #{@user.email} with instructions on how to validate your account."
        redirect_to(:action => "index")
      end
    end
 
  end
 
  # confirm an email address
  def confirm_email
 
  end
 
 
  private

  # create a hash to use when confirming User email addresses
  def confirmation_hash(string)
    Digest::SHA1.hexdigest(string + "secret word")
  end
 
end
