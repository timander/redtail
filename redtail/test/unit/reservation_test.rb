require File.dirname(__FILE__) + '/../test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @options = {
      :user => User.new,
      :restaurant => Restaurant.new,
      :lunch_period => LunchPeriod.new(:to_go_available => true),
      :take_out => 'yes'
    }
  end

  test "requires user"  do
    @options.delete(:user)
    reservation = Reservation.create(@options)
    assert !reservation.valid?
    assert reservation.errors.on(:user)
  end
  
  test "requires take out selection" do
    @options.delete(:take_out)
    reservation = Reservation.create(@options)
    assert !reservation.valid?
    assert reservation.errors.on(:take_out)
  end
  
  test "valid restaurant" do
    reservation = Reservation.create(@options)
    assert reservation.valid?
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
