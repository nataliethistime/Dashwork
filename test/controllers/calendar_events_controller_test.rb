require 'test_helper'

class CalendarEventsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @calendar_event = calendar_events(:one)
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

  test 'should create calendar_event' do
    assert_difference('CalendarEvent.count') do
      post :create, params: {
        calendar_event: {
          description: @calendar_event.description,
          end_at: @calendar_event.end_at,
          name: @calendar_event.name,
          start_at: @calendar_event.start_at
        }
      }
    end
    assert_response :redirect
  end

  test 'should show calendar_event' do
    get :show, params: { id: @calendar_event.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @calendar_event.id }
    assert_response :success
  end

  test 'should update calendar_event' do
    patch :update, params: {
      id: @calendar_event.id,
      calendar_event: {
        description: @calendar_event.description,
        end_at: @calendar_event.end_at,
        name: @calendar_event.name,
        start_at: @calendar_event.start_at
      }
    }
    assert_redirected_to calendar_event_url(@calendar_event)
  end

  test 'should destroy calendar_event' do
    assert_difference('CalendarEvent.count', -1) do
      delete :destroy, params: { id: @calendar_event.id }
    end
    assert_redirected_to calendar_events_url
  end
end
