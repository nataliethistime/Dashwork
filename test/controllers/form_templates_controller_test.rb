require 'test_helper'

class FormTemplatesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @form_template = form_templates(:one)
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

  test 'should create form_template' do
    assert_difference('FormTemplate.count') do
      post :create, params: {
        form_template: {
          name: @form_template.name
        }
      }
    end
    assert_response :redirect
  end

  test 'should show form_template' do
    get :show, params: { id: @form_template.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @form_template.id }
    assert_response :success
  end

  test 'should update form_template' do
    patch :update, params: {
      id: @form_template.id,
      form_template: {
        name: @form_template.name
      }
    }
    assert_redirected_to form_template_url(@form_template)
  end

  test 'should destroy form_template' do
    tmpl = @form_template.dup
    tmpl.save!
    assert_difference('FormTemplate.count', -1) do
      delete :destroy, params: { id: tmpl.id }
    end
    assert_redirected_to form_templates_url
  end
end
