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
                params[:reservation].merge(
                  :restaurant_id => params[:restaurant][:id], 
                  :user_id => session[:user_id], 
                  :lunch_period_id => params[:lunch_period][:id]))
    if @reservation.valid?
      redirect_to reservation_url(@reservation)
    else
      render :action => "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
end
