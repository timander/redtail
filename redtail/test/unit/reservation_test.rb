require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  fixtures :users

  def test_logout
    @request.session[:uid] = "something"

    get :logout

    assert_response :success
    assert_nil @request.session[:uid]
    assert_equal "you are logged out", @response.body
  end

  def test_get_login
    get :login

    assert_response :success
  end

  def test_post_login_good
    post :login, { "login" => "ron", "password" => "my_password" }

    assert_equal users(:ron).id, @request.session[:uid]
    assert_response :redirect
    assert_redirected_to :controller => 'reservation'
  end
  
  def test_post_login_good_redirected_back_to_url
    @request.session[:requested_url] = { :controller => 'restuarants'}
    post :login, { "login" => "ron", "password" => "my_password" }

    assert_equal users(:ron).id, @request.session[:uid]
    assert_response :redirect
    assert_redirected_to :controller => 'restuarants'
  end
  
  def test_post_login_bad_password
    post :login, { "login" => "ron", "password" => "BAD_PASSWORD" }

    assert_nil @request.session[:uid]
    assert_response :success
    assert_equal "Invalid login/password", assigns["auth_error"]
  end

  def test_post_login_bad_user
    post :login, { "login" => "bad_user", "password" => "my_password" }

    assert_nil @request.session[:uid]
    assert_response :success
    assert_equal "Invalid login/password", assigns["auth_error"]
  end
  
end
