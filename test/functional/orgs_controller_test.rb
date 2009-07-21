require 'test_helper'

class OrgsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org" do
    assert_difference('Org.count') do
      post :create, :org => { }
    end

    assert_redirected_to org_path(assigns(:org))
  end

  test "should show org" do
    get :show, :id => orgs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => orgs(:one).to_param
    assert_response :success
  end

  test "should update org" do
    put :update, :id => orgs(:one).to_param, :org => { }
    assert_redirected_to org_path(assigns(:org))
  end

  test "should destroy org" do
    assert_difference('Org.count', -1) do
      delete :destroy, :id => orgs(:one).to_param
    end

    assert_redirected_to orgs_path
  end
end
