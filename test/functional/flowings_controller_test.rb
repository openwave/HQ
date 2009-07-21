require 'test_helper'

class FlowingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flowings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flowing" do
    assert_difference('Flowing.count') do
      post :create, :flowing => { }
    end

    assert_redirected_to flowing_path(assigns(:flowing))
  end

  test "should show flowing" do
    get :show, :id => flowings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flowings(:one).to_param
    assert_response :success
  end

  test "should update flowing" do
    put :update, :id => flowings(:one).to_param, :flowing => { }
    assert_redirected_to flowing_path(assigns(:flowing))
  end

  test "should destroy flowing" do
    assert_difference('Flowing.count', -1) do
      delete :destroy, :id => flowings(:one).to_param
    end

    assert_redirected_to flowings_path
  end
end
