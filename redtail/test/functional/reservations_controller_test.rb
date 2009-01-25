require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase

  fixtures :reservations, :users, :lunch_periods, :dressings

  test "routes" do
    assert_routing '/reservations', {:controller => "reservations", :action => "index"}
    assert_routing '/reservations/new', {:controller => "reservations", :action => "new"}
    assert_routing '/reservations/1', {:controller => "reservations", :action => "show", :id => "1"}
    assert_routing({:method => 'post', :path => '/reservations'}, {:controller => "reservations", :action => "create"})
  end

  test "index as admin" do
    logged_in_as users(:lou)
    get :index
    assert_response :success
    assert_equal Reservation.find(:all), assigns["reservations"]
  end

  test "index as non logged-in user" do
    get :index
    assert_response :redirect
    assert_redirected_to login_url
  end

  test "index as normal user" do
    logged_in_as users(:ron)
    get :index
    assert_response 401
  end

  test "new" do
    logged_in_as users(:ron)
    get :new
    assert_not_nil assigns["reservation"]
    assert assigns["reservation"].instance_of?(Reservation)
  end

  test "create" do
    logged_in_as users(:ron)

    assert_difference('Reservation.count') do
      post :create, {:reservation => {:restaurant_id => restaurants(:italian).id, :lunch_period_id => lunch_periods(:first).id} }
    end
    
    assert_response :redirect
    new_reservation = Reservation.last
    assert_redirected_to reservation_url(new_reservation)
  end

  test "create with invalid reservation" do
    logged_in_as users(:ron)
    post :create, {:reservation => { }, :restaurant => { :id => restaurants(:italian).id }, :lunch_period => { :id => nil } }
    assert_response :success
    assert_template "new"
  end

  test "show" do
    logged_in_as users(:ron)

    reservation = Reservation.create(:user => users(:ron),
                                     :restaurant => restaurants(:italian),
                                     :lunch_period => lunch_periods(:first), 
                                     :to_go => 0)
    
    get :show, :id => reservation.id
    assert_response :success
    assert_equal reservation, assigns["reservation"]
  end
  
end
