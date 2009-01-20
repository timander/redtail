require File.dirname(__FILE__) + '/../test_helper'

class RestaurantTest < ActiveSupport::TestCase

  def test_name_on_date
    restaurant = Restaurant.new(:name => "Some Restaurant",
                                :date => Date.today)
    assert_equal "Some Restaurant on #{Date.today}", restaurant.name_on_date
  end

  def test_find_next
    restaurant_in_past = Restaurant.create(:name => 'past', :date => Date.yesterday)
    next_restaurant = Restaurant.create(:name => 'next', :date => Date.tomorrow)
    restaurant_in_future = Restaurant.create(:name => 'future', :date => 2.days.from_now)

    assert_equal next_restaurant, Restaurant.find_next
  end

end
