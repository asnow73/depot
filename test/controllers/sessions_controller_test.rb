require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    post :create, name: @user.name, password: @user.password
    assert_redirected_to admin_url
    assert_equal @user.id, session[:user_id]
  end

  test "should fail login" do
    post :create, name: @user.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
