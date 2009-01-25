require 'test_helper'

class DressingsControllerTest < ActionController::TestCase

  def setup
    logged_in_as users(:lou)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dressings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dressing" do
    assert_difference('Dressing.count') do
      post :create, :dressing => { }
    end

    assert_redirected_to dressing_path(assigns(:dressing))
  end

  test "should show dressing" do
    get :show, :id => dressings(:ranch).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dressings(:ranch).id
    assert_response :success
  end

  test "should update dressing" do
    put :update, :id => dressings(:ranch).id, :dressing => { }
    assert_redirected_to dressing_path(assigns(:dressing))
  end

  test "should destroy dressing" do
    assert_difference('Dressing.count', -1) do
      delete :destroy, :id => dressings(:ranch).id
    end

    assert_redirected_to dressings_path
  end
end
