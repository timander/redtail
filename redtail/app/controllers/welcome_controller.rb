class WelcomeController < ApplicationController

  skip_filter :user_is_authenticated?
  before_filter :admin?, :only => :admin
      
  def index
    @user = session_user
    @next_restaurant = Restaurant.find_next
    @first_lunch = LunchPeriod.find_by_period(1)
    @second_lunch = LunchPeriod.find_by_period(2)
  end

  def admin
    @user = session_user
  end

end
