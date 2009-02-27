require 'test_helper'

class UserControllerTest < ActionController::TestCase
  fixtures :users


  def test_logout
    @request.session[:user_id] = "something"

    get :logout

    assert_response :success
    assert_nil @request.session[:user_id]
  end

  def test_get_login
    get :login
    
    assert_response :success
  end

  def test_post_login_good
    post :login, { "email" => "ron@ron.com", "password" => "pass" }

    assert_equal users(:ron).id, @request.session[:user_id]
    assert_response :redirect
    assert_redirected_to new_reservation_url
  end
  
  def test_post_login_admin
    post :login, { "email" => "lou@lou.com", "password" => "pass" }

    assert_equal users(:lou).id, @request.session[:user_id]
    assert_response :redirect
    assert_redirected_to admin_url
  end

  def test_post_login_good_redirected_back_to_url
    @request.session[:requested_url] = { :controller => 'restuarants'}
    
    post :login, { "email" => "ron@ron.com", "password" => "pass" }

    assert_equal users(:ron).id, @request.session[:user_id]
    assert_response :redirect
    assert_redirected_to :controller => 'restuarants'
  end
  
  def test_post_login_bad_password
    post :login, { "email" => "ron@ron.com", "password" => "BAD_PASSWORD" }

    assert_nil @request.session[:user_id]
    assert_response :success
    assert_equal "Invalid login/password", assigns["auth_error"]
  end

  def test_post_login_bad_user
    post :login, { "email" => "bad_email@ron.com", "password" => "my_password" }

    assert_nil @request.session[:user_id]
    assert_response :success
    assert_equal "Invalid login/password", assigns["auth_error"]
  end
  
  def test_confirm_email
    get :confirm_email
    
    assert_redirected_to root_url
  end
  
  
  
  
end
