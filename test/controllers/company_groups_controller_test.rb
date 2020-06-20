class CompanyGroupsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @company_group = company_groups(:suppliers)
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

  test 'should create company group' do
    assert_difference('CompanyGroup.count') do
      post :create, params: {
        company_group: {
          name: @company_group.name
        }
      }
    end
    assert_response :redirect
  end

  test 'should show company group' do
    get :show, params: { id: @company_group.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @company_group.id }
    assert_response :success
  end

  test 'should update company group' do
    patch :update, params: { id: @company_group.id, company_group: { name: @company_group.name } }
    assert_redirected_to company_group_url(@company_group)
  end

  test 'should destroy company group' do
    assert_difference('CompanyGroup.count', -1) do
      delete :destroy, params: { id: @company_group.id }
    end
    assert_redirected_to company_groups_url
  end
end
