class ReservationsController < ApplicationController
    
  def index
    @user = session_user
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
    restaurant = Restaurant.find(params[:restaurant][:id])
    user = User.find(session[:user_id])
    @reservation = Reservation.create(
                params[:reservation].merge(
                  :restaurant => restaurant, :user => user))
    if @reservation.valid?
      flash[:notice] = "Thank you for your reservation, #{user.username}.  We'll see you at the #{restaurant.name} on #{restaurant.date}."
      redirect_to reservation_url(@reservation)
    else
      render :action => "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
end
