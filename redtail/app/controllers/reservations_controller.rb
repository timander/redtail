class ReservationsController < ApplicationController
    
  def index
    @reservations = Reservation.find(:all)
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

  def create
    @reservation = Reservation.create(
                params[:reservation].merge(
                  :restaurant_id => params[:restaurant][:id], 
                  :user => session_user, 
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
