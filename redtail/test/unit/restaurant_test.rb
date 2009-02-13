require File.dirname(__FILE__) + '/../test_helper'

class RestaurantTest < ActiveSupport::TestCase
  
  def setup
    Restaurant.destroy_all
    @valid_options = {
      :name => 'name',
      :date => Date.today,
      :price => 6,
      :description => "this is the description"
    }
  end

  def test_name_on_date
    restaurant = Restaurant.new(:name => "Some Restaurant",
                                :date => Date.today)
    assert_equal "Some Restaurant on #{Date.today}", restaurant.name_on_date
  end

  def test_find_next
    restaurant_in_past = Restaurant.create(@valid_options.merge(:date => Date.yesterday))
    next_restaurant = Restaurant.create(@valid_options.merge(:date => Date.tomorrow))
    restaurant_in_future = Restaurant.create(@valid_options.merge(:date => 2.days.from_now))

    assert_equal next_restaurant, Restaurant.find_next
  end

end
