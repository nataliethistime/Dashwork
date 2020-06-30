class TagsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @company_tag = company_tags(:suppliers)
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get :index, params: { type: 'company' }
    assert_response :success
  end

  test 'should get new' do
    get :new, params: { type: 'company' }
    assert_response :success
  end

  test 'should create company tag' do
    assert_difference('CompanyTag.count') do
      post :create, params: {
        type: 'company',
        company_tag: {
          name: @company_tag.name
        }
      }
    end
    assert_response :redirect
  end

  test 'should show company tag' do
    get :show, params: { id: @company_tag.id, type: 'company' }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @company_tag.id, type: 'company' }
    assert_response :success
  end

  test 'should update company tag' do
    patch :update, params: {
      id: @company_tag.id,
      type: 'company',
      company_tag: {
        name: @company_tag.name
      }
    }
    assert_response :redirect
  end

  test 'should destroy company tag' do
    assert_difference('CompanyTag.count', -1) do
      delete :destroy, params: { id: @company_tag.id, type: 'company' }
    end
    assert_response :redirect
  end
end
