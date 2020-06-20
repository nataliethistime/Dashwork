require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @task = tasks(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, params: {
        task: {
          description: @task.description,
          due_date: @task.due_date,
          name: @task.name
        }
      }
    end
    assert_response :redirect
  end

  test "should show task" do
    get :show, params: { id: @task.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @task.id }
    assert_response :success
  end

  test "should update task" do
    patch :update, params: { id: @task.id, task: { completed: true } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, params: { id: @task.id }
    end
    assert_redirected_to tasks_url
  end
end
