require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  fixtures :restaurants

  def test_index
    get :index
        
    assert_response :success
    assert_equal(restaurants(:greek), assigns["next_restaurant"])
  end
  
end
