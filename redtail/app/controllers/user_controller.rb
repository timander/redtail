require "digest/sha1"
 
class UserController < ApplicationController
  skip_filter :user_is_authenticated?
 
  def login
    if request.post?
      @user = User.find_by_username(params[:login])
      
      if @user and @user.password_is? params[:password]
        session[:uid] = @user.id
        if flash[:requested_url]
          redirect_to flash[:requested_url]
        else
          redirect_to new_reservation_url
        end
      else
        @auth_error = "Invalid login/password"
      end
    else
      # first display
    end
  end
  
  def logout
    session[:uid] = nil
    render :text => "you are logged out"
  end
  
  # allows guests to create a new User
  # allows guests to create a new User
  def register
    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])

      if @user.save
        MailRobot::deliver_confirmation_email(@user, confirmation_hash(@user.username))

        flash[:notice] = "Thank you for registering! We have sent a confirmation email to #{@user.email} with instructions on how to validate your account."
        redirect_to root_url
      end
    end
 
  end
   
  # confirm an email address
  def confirm_email
 
    @users = User.find :all

    for user in @users
      # if the passed hash matches up with a User, confirm him, log him in, set proper flash[:notice], and stop looking
      if confirmation_hash(user.username) == params[:hash] and !user.email_confirmed
        user.update_attributes(:email_confirmed => true)
        session[:user_id] = user.id
        flash[:notice] = "Thank you for validating your email."
        break
      end
    end
    redirect_to root_url
 
  end
 
 
  private

  # create a hash to use when confirming User email addresses
  def confirmation_hash(string)
    Digest::SHA1.hexdigest(string + "shark")
  end
 
end
