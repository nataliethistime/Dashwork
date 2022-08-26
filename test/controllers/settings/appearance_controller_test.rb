require 'test_helper'

module Settings
  class AppearanceControllerTest < ActionController::TestCase
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
      put :update, params: { id: @user.id, user: { preferred_theme: 'dark' } }
      assert_response :redirect
    end
  end
end
