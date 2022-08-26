require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @project = projects(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get closed' do
    get :closed
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post :create, params: {
        project: {
          description: @project.description,
          end_date: @project.end_date,
          name: @project.name,
          start_date: @project.start_date
        }
      }
    end
    assert_response :redirect
  end

  test 'should show project' do
    get :show, params: { id: @project.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @project.id }
    assert_response :success
  end

  test 'should update project' do
    patch :update, params: {
      id: @project.id,
      project: {
        description: @project.description,
        end_date: @project.end_date,
        name: @project.name,
        start_date: @project.start_date
      }
    }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete :destroy, params: { id: @project.id }
    end

    assert_redirected_to projects_url
  end
end
