require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @equipment = equipment(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create equipment' do
    assert_difference('Equipment.count') do
      post :create, params: {
        equipment: {
          description: @equipment.description,
          manufacturer: @equipment.manufacturer,
          model: @equipment.model,
          name: @equipment.name
        }
      }
    end
    assert_response :redirect
  end

  test 'should show equipment' do
    get :show, params: { id: @equipment.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @equipment.id }
    assert_response :success
  end

  test 'should update equipment' do
    patch :update, params: {
      id: @equipment.id,
      equipment: {
        description: @equipment.description,
        manufacturer: @equipment.manufacturer,
        model: @equipment.model,
        name: @equipment.name
      }
    }
    assert_redirected_to equipment_url(@equipment)
  end

  test 'should destroy equipment' do
    assert_difference('Equipment.count', -1) do
      delete :destroy, params: { id: @equipment.id }
    end
    assert_redirected_to equipment_index_url
  end
end
