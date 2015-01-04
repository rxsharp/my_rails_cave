require 'test_helper'

class LearningStatusesControllerTest < ActionController::TestCase
  setup do
    @learning_status = learning_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_status" do
    assert_difference('LearningStatus.count') do
      post :create, learning_status: { learning_status: @learning_status.learning_status, user_id: @learning_status.user_id }
    end

    assert_redirected_to learning_status_path(assigns(:learning_status))
  end

  test "should show learning_status" do
    get :show, id: @learning_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learning_status
    assert_response :success
  end

  test "should update learning_status" do
    patch :update, id: @learning_status, learning_status: { learning_status: @learning_status.learning_status, user_id: @learning_status.user_id }
    assert_redirected_to learning_status_path(assigns(:learning_status))
  end

  test "should destroy learning_status" do
    assert_difference('LearningStatus.count', -1) do
      delete :destroy, id: @learning_status
    end

    assert_redirected_to learning_statuses_path
  end
end
