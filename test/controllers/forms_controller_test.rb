require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @template = form_templates(:one)
    @form = forms(:one)
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

  test 'should create form' do
    assert_difference('Form.count') do
      post :create, params: {
        form: {
          name: @form.name,
          form_template_id: @template.id
        }
      }
    end
    assert_response :redirect
  end

  test 'should show form' do
    get :show, params: { id: @form.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @form.id }
    assert_response :success
  end

  test 'should update form' do
    patch :update, params: {
      id: @form.id,
      form: {
        name: @form.name
      }
    }
    assert_redirected_to form_url(@form)
  end

  test 'should destroy form' do
    assert_difference('Form.count', -1) do
      delete :destroy, params: { id: @form.id }
    end
    assert_redirected_to forms_url
  end
end
