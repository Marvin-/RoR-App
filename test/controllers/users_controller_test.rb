require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:marvin)
  end

  test "should redirect edit when not logged in" do 
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when not logged in" do 
    patch :update, id: @user, user: { name: @user.username, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_path
  end
end
