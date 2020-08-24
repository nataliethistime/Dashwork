require 'test_helper'

module PersonalLog
  class EntriesControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      @personal_log_entry = personal_log_entries(:one)
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

    test 'should create personal_log_entry' do
      assert_difference('PersonalLog::Entry.count') do
        post :create, params: {
          personal_log_entry: {
            content: @personal_log_entry.content
          }
        }
      end

      assert_response :redirect
    end

    test 'should show personal_log_entry' do
      get :show, params: { id: @personal_log_entry.id }
      assert_response :success
    end

    test 'should get edit' do
      get :edit, params: { id: @personal_log_entry.id }
      assert_response :success
    end

    test 'should update personal_log_entry' do
      patch :update, params: {
        id: @personal_log_entry.id,
        personal_log_entry: {
          content: @personal_log_entry.content
        }
      }
      assert_redirected_to personal_log_entry_url(@personal_log_entry)
    end

    test 'should destroy personal_log_entry' do
      assert_difference('PersonalLog::Entry.count', -1) do
        delete :destroy, params: { id: @personal_log_entry.id }
      end

      assert_redirected_to personal_log_entries_url
    end
  end
end
