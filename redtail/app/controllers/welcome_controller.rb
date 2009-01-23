class WelcomeController < ApplicationController
  skip_filter :user_is_authenticated?

  def index
    @user = session_user
    @next_restaurant = Restaurant.find_next
    @first_lunch = LunchPeriod.find_by_period(1)
    @second_lunch = LunchPeriod.find_by_period(2)
  end

end
