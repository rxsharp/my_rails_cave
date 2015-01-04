require 'test_helper'

class LearningToolsControllerTest < ActionController::TestCase
  setup do
    @learning_tool = learning_tools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_tool" do
    assert_difference('LearningTool.count') do
      post :create, learning_tool: { learning_material: @learning_tool.learning_material, learning_section: @learning_tool.learning_section, progress: @learning_tool.progress, user_id: @learning_tool.user_id }
    end

    assert_redirected_to learning_tool_path(assigns(:learning_tool))
  end

  test "should show learning_tool" do
    get :show, id: @learning_tool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learning_tool
    assert_response :success
  end

  test "should update learning_tool" do
    patch :update, id: @learning_tool, learning_tool: { learning_material: @learning_tool.learning_material, learning_section: @learning_tool.learning_section, progress: @learning_tool.progress, user_id: @learning_tool.user_id }
    assert_redirected_to learning_tool_path(assigns(:learning_tool))
  end

  test "should destroy learning_tool" do
    assert_difference('LearningTool.count', -1) do
      delete :destroy, id: @learning_tool
    end

    assert_redirected_to learning_tools_path
  end
end
