class ReservationsController < ApplicationController
  
  before_filter :admin?, :only => :index
    
  def index
    @reservations = Reservation.find(:all)
  end
  
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(
                     params[:reservation].merge(:user_id => session[:user_id]))

    if @reservation.valid?
      MailRobot::deliver_reservation_email(@user, @reservation)
      redirect_to reservation_url(@reservation)
    else
      render :action => "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
end
