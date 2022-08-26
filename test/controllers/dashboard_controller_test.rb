require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:one)
    sign_in @user, scope: :user
  end

  test 'should get home' do
    get :home
    assert_response :success
  end
end
