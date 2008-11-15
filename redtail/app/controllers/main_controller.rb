class MainController < ApplicationController

  def register
    if request.post?
      @user = User.new params[:user]
      if @user.save
        flash[:info] = 'You are registered now'
      end
    end
  end

  def login
      if request.post?
        @user = User.find_by_username(params[:login])
  	if @user and @user.password_is? params[:password]
  	   session[:uid] = @user.id
           redirect_to :controller => 'panel', :action => 'secret'
  	else 
  	   @auth_error = 'Wrong username or password'
  	end
      end
    end

end
