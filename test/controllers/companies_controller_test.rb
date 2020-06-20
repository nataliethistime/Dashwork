require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @company = companies(:one)
    @user = users(:one)
    sign_in @user, scope: :user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company' do
    assert_difference('Company.count') do
      post :create, params: {
        company: {
          description: @company.description,
          email: @company.email,
          name: @company.name,
          phone: @company.phone,
          website: @company.website
        }
      }
    end

    assert_response :redirect
  end

  test 'should show company' do
    get :show, params: { id: @company.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @company.id }
    assert_response :success
  end

  test 'should update company' do
    patch :update, params: {
      id: @company.id,
      company: {
        description: @company.description,
        email: @company.email,
        name: @company.name,
        phone: @company.phone,
        website: @company.website
      }
    }
    assert_redirected_to company_url(@company)
  end

  test 'should destroy company' do
    assert_difference('Company.count', -1) do
      delete :destroy, params: { id: @company.id }
    end

    assert_redirected_to companies_url
  end
end
