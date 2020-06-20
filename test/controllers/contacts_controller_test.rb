require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:one)
    @contact = contacts(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, params: {
        contact: {
          description: @contact.description,
          email: @contact.email,
          name: @contact.name,
          website: @contact.website
        }
      }
    end

    assert_redirected_to contact_path(Contact.last)
  end

  test "should show contact" do
    get :show, params: { id: @contact.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @contact.id }
    assert_response :success
  end

  test "should update contact" do
    patch :update, params: {
      id: @contact.id,
      contact: {
        description: @contact.description,
        email: @contact.email,
        name: @contact.name,
        website: @contact.website
      }
    }
    assert_redirected_to contact_path(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, params: { id: @contact.id }
    end

    assert_redirected_to contacts_path
  end
end
