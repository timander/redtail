require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  fixtures :restaurants, :users, :lunch_periods

  test 'index as normal user logged in' do
    logged_in_as users(:ron)
    get :index
        
    assert_response :success
    
    assert_equal(users(:ron), assigns["user"])
    assert_equal(lunch_periods(:first), assigns["first_lunch"])
    assert_equal(lunch_periods(:second), assigns["second_lunch"])
    assert_equal(restaurants(:greek), assigns["next_restaurant"])
  end


  test 'index not logged in' do
    get :index
        
    assert_response :success
    
    assert_equal(nil, assigns["user"])
    assert_equal(lunch_periods(:first), assigns["first_lunch"])
    assert_equal(lunch_periods(:second), assigns["second_lunch"])
    assert_equal(restaurants(:greek), assigns["next_restaurant"])
  end
  
end
