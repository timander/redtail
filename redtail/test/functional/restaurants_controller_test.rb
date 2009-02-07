require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

fixtures :restaurants, :reservations, :users, :lunch_periods

  def setup
    logged_in_as users(:lou)
  end

  test "routes" do
    assert_routing '/restaurants', {:controller => "restaurants", :action => "index"}
    assert_routing '/restaurants/new', {:controller => "restaurants", :action => "new"}
    assert_routing '/restaurants/1', {:controller => "restaurants", :action => "show", :id => "1"}
    assert_routing({:method => 'post', :path => '/restaurants'}, {:controller => "restaurants", :action => "create"})
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns["restaurant"]
    assert_not_nil assigns["selections"]
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, :restaurant => { }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, :id => restaurants(:greek).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => restaurants(:greek).id
    assert_response :success
  end

  test "should update restaurant" do
    put :update, :id => restaurants(:greek).id, :restaurant => { }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, :id => restaurants(:greek).id
    end

    assert_redirected_to restaurants_path
  end
  
  test "user is not admin" do
    logged_in_as users(:ron)
    get :index
    assert_response 401
  end
  
end
