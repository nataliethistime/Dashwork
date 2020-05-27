require 'test_helper'

class FormTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_template = form_templates(:one)
  end

  test "should get index" do
    get form_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_form_template_url
    assert_response :success
  end

  test "should create form_template" do
    assert_difference('FormTemplate.count') do
      post form_templates_url, params: { form_template: { name: @form_template.name } }
    end

    assert_redirected_to form_template_url(FormTemplate.last)
  end

  test "should show form_template" do
    get form_template_url(@form_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_template_url(@form_template)
    assert_response :success
  end

  test "should update form_template" do
    patch form_template_url(@form_template), params: { form_template: { name: @form_template.name } }
    assert_redirected_to form_template_url(@form_template)
  end

  test "should destroy form_template" do
    assert_difference('FormTemplate.count', -1) do
      delete form_template_url(@form_template)
    end

    assert_redirected_to form_templates_url
  end
end
