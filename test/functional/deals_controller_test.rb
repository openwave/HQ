require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, :deal => { }
    end

    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, :id => deals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => deals(:one).to_param
    assert_response :success
  end

  test "should update deal" do
    put :update, :id => deals(:one).to_param, :deal => { }
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    assert_difference('Deal.count', -1) do
      delete :destroy, :id => deals(:one).to_param
    end

    assert_redirected_to deals_path
  end
end
