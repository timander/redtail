# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0ef170a78b236246ea72459155a1efd8'

  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password


  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_hungryhawk_session_id'

  before_filter :user_is_authenticated?

  private

  def user_is_authenticated?
    unless session[:user_id]
      flash[:requested_url] = params
      redirect_to login_url
    end
  end

  def admin?
    session_user.admin?
  end

  def session_user
    @user ||= User.find_by_id(session[:user_id])
  end

end
