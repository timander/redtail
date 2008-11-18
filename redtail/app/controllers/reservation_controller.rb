class ReservationController < ApplicationController
  def index
    @user = User.find_by_id(session[:uid])
    if (@user)
    else
      redirect_to :controller => 'main', :action => 'login'
    end
  end  
end
