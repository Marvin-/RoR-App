require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:marvin)
    @user2 = users(:queen)
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

  test "should redirect edit when logged in as wrong user" do 
    log_in_as(@user2)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do 
    log_in_as(@user2)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }

    assert flash.empty?
    assert_redirected_to root_url
  end
end
