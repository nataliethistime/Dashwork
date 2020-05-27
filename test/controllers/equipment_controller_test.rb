require 'test_helper'

class EquipmentControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get equipment_index_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_url
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post equipment_index_url, params: { equipment: { description: @equipment.description, manufacturer: @equipment.manufacturer, model: @equipment.model, name: @equipment.name } }
    end

    assert_redirected_to equipment_url(Equipment.last)
  end

  test "should show equipment" do
    get equipment_url(@equipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_url(@equipment)
    assert_response :success
  end

  test "should update equipment" do
    patch equipment_url(@equipment), params: { equipment: { description: @equipment.description, manufacturer: @equipment.manufacturer, model: @equipment.model, name: @equipment.name } }
    assert_redirected_to equipment_url(@equipment)
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete equipment_url(@equipment)
    end

    assert_redirected_to equipment_index_url
  end
end
