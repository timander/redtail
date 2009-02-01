require File.dirname(__FILE__) + '/../test_helper'

class ReservationTest < ActiveSupport::TestCase

  def setup
    @to_go_options = {
      :user => User.new,
      :restaurant => Restaurant.new,
      :lunch_period => LunchPeriod.new(:to_go_available => true),
      :to_go => 1
    }
  end

  test "requires user"  do
    @to_go_options.delete(:user)
    reservation = Reservation.create(@to_go_options)
    assert !reservation.valid?
    assert reservation.errors.on(:user)
  end
    
  test "valid restaurant" do
    reservation = Reservation.create(@to_go_options)
    assert reservation.valid?
  end
  
  test "requires restaurant"  do
    @to_go_options.delete(:restaurant)
    reservation = Reservation.create(@to_go_options)
    assert !reservation.valid?
    assert reservation.errors.on(:restaurant)
  end
  
  test "requires lunch period"  do
    @to_go_options.delete(:lunch_period)
    reservation = Reservation.create(@to_go_options)
    assert !reservation.valid?
    assert reservation.errors.on(:lunch_period)
  end

  test "to go not available for lunch period"  do
    reservation = Reservation.create(:user => User.new,
                                     :restaurant => Restaurant.new,
                                     :lunch_period => lunch_periods(:first),
                                     :to_go => 1)
    assert !reservation.valid?
    assert reservation.errors.on(:to_go)
  end

  test "to go valid"  do
    reservation = Reservation.create(@to_go_options)
    assert reservation.valid?
  end

  test "validate user on save" do
    @to_go_options.delete(:user)
    reservation = Reservation.create(@to_go_options)
    assert !reservation.save, "Saved reservation without user"
  end
  
end
