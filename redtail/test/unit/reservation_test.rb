require File.dirname(__FILE__) + '/../test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @options = {
      :user => User.new,
      :restaurant => Restaurant.new,
      :lunch_period => LunchPeriod.new
    }
  end

  test "requires user"  do
    @options.delete(:user)
    reservation = Reservation.create(@options)
    assert !reservation.valid?
    assert reservation.errors.on(:user)
  end
  
  test "requires restaurant"  do
    @options.delete(:restaurant)
    reservation = Reservation.create(@options)
    assert !reservation.valid?
    assert reservation.errors.on(:restaurant)
  end
  
  test "requires lunch period"  do
    @options.delete(:lunch_period)
    reservation = Reservation.create(@options)
    assert !reservation.valid?
    assert reservation.errors.on(:lunch_period)
  end
  
  def test_save_validate_user
    reservation = Reservation.new(:restaurant => restaurants(:greek), :lunch_period => lunch_periods(:first), :take_out => 'no')
    assert !reservation.save, "Saved reservation without user"
  end
  
end
