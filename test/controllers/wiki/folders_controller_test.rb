require 'test_helper'

module Wiki
  class FoldersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    def setup
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

    test 'should create folder' do
      assert_difference('Wiki::Folder.count') do
        post :create, params: {
          wiki_folder: {
            name: 'Test Folder'
          }
        }
      end

      assert_response :redirect
    end

    test 'should show folder' do
      get :show, params: { id: wiki_folders(:one).id }
      assert_response :success
      get :show, params: { id: wiki_folders(:two).id }
      assert_response :success
    end

    test 'should get edit' do
      get :edit, params: { id: wiki_folders(:one).id }
      assert_response :success
      get :edit, params: { id: wiki_folders(:two).id }
      assert_response :success
    end

    test 'should update folder' do
      folder = wiki_folders(:one)
      patch :update, params: {
        id: folder.id,
        wiki_folder: {
          name: 'New Folder Name'
        }
      }
      assert_response :redirect
      assert_redirected_to wiki_folder_path(folder)
    end

    test 'should destroy folder' do
      folder = wiki_folders(:one).dup
      folder.save!
      assert_difference('Wiki::Folder.count', -1) do
        delete :destroy, params: { id: folder.id }
      end

      assert_redirected_to wiki_folders_path
    end
  end
end
