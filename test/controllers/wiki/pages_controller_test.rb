require 'test_helper'

module Wiki
  class PagesControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    def setup
      @user = users(:one)
      sign_in @user, scope: :user
    end

    test 'should get new' do
      get :new
      assert_response :success
    end

    test 'should create page' do
      assert_difference('Wiki::Page.count') do
        post :create, params: {
          wiki_page: {
            title: 'Test Page',
            content: 'This is some really cool, beautiful and interesting content'
          }
        }
      end

      assert_response :redirect
    end

    test 'should show page' do
      get :show, params: { id: wiki_pages(:one).id }
      assert_response :success
      get :show, params: { id: wiki_pages(:two).id }
      assert_response :success
    end

    test 'should get edit' do
      get :edit, params: { id: wiki_pages(:one).id }
      assert_response :success
      get :edit, params: { id: wiki_pages(:two).id }
      assert_response :success
    end

    test 'should update page' do
      page = wiki_pages(:one)
      patch :update, params: {
        id: page.id,
        wiki_page: {
          title: 'New Folder Name'
        }
      }
      assert_response :redirect
      assert_redirected_to wiki_page_path(page)
    end

    test 'should destroy page' do
      page = wiki_pages(:one).dup
      page.save!
      assert_difference('Wiki::Page.count', -1) do
        delete :destroy, params: { id: page.id }
      end

      assert_redirected_to wiki_folders_path
    end
  end
end
