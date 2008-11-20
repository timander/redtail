class ReservationController < ApplicationController
  def index
    @user = User.find_by_id(session[:uid])
    if (@user)
    else
      redirect_to :controller => 'main', :action => 'login'
    end
  end
  
  # GET /reservations/new
  # GET /reservations/new.xml
  def new
    @reservation = Reservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reservation }
    end
  end

end
