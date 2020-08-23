require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @asset = assets(:one)
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

  test 'should create asset' do
    assert_difference('Asset.count') do
      post :create, params: {
        asset: {
          name: 'Suzuki Swift'
        }
      }
    end

    assert_response :redirect
  end

  test 'should show asset' do
    get :show, params: { id: @asset.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @asset.id }
    assert_response :success
  end

  test 'should update asset' do
    patch :update, params: {
      id: @asset.id,
      asset: {
        name: 'Something Else'
      }
    }
    assert_redirected_to asset_url(@asset)
  end

  test 'should destroy asset' do
    assert_difference('Asset.count', -1) do
      delete :destroy, params: { id: @asset.id }
    end

    assert_redirected_to assets_url
  end
end
