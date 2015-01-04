require 'test_helper'

class HubListsControllerTest < ActionController::TestCase
  setup do
    @hub_list = hub_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hub_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hub_list" do
    assert_difference('HubList.count') do
      post :create, hub_list: { bitbucket: @hub_list.bitbucket, codepen: @hub_list.codepen, github: @hub_list.github, user_id: @hub_list.user_id }
    end

    assert_redirected_to hub_list_path(assigns(:hub_list))
  end

  test "should show hub_list" do
    get :show, id: @hub_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hub_list
    assert_response :success
  end

  test "should update hub_list" do
    patch :update, id: @hub_list, hub_list: { bitbucket: @hub_list.bitbucket, codepen: @hub_list.codepen, github: @hub_list.github, user_id: @hub_list.user_id }
    assert_redirected_to hub_list_path(assigns(:hub_list))
  end

  test "should destroy hub_list" do
    assert_difference('HubList.count', -1) do
      delete :destroy, id: @hub_list
    end

    assert_redirected_to hub_lists_path
  end
end
