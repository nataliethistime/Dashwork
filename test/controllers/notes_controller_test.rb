require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @note = notes(:one)
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

  test 'should create note' do
    assert_difference('Note.count') do
      post :create, params: {
        note: {
          title: @note.title,
          content: @note.content
        }
      }
    end
    assert_response :redirect
  end

  test 'should show note' do
    get :show, params: { id: @note.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @note.id }
    assert_response :success
  end

  test 'should update note' do
    patch :update, params: {
      id: @note.id,
      note: {
        content: @note.content
      }
    }
    assert_redirected_to note_url(@note)
  end

  test 'should destroy note' do
    assert_difference('Note.count', -1) do
      delete :destroy, params: { id: @note.id }
    end
    assert_redirected_to notes_url
  end
end
