require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  def test_logout
    @request.session[:uid] = "something"

    get :logout

    assert_response :success
    assert_nil @request.session[:uid]
    assert_equal "you are logged out", @response.body
  end
end
