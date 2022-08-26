require 'test_helper'

module Settings
  class ProfileControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    def setup
      @user = users(:one)
      sign_in @user
    end

    test 'index' do
      get :index
      assert_response :success
    end

    test 'update' do
      put :update, params: { id: @user.id, user: { first_name: 'Zoe' } }
      assert_response :redirect
    end
  end
end
