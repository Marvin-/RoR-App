require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @user = User.new(username: "Marvin", email: "name@email.com", 
                      password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do 
    assert @user.valid?
  end

  test "should have username" do 
    @user.username = " "
    assert_not @user.valid?
  end 

  test "should have email" do 
    @user.email = " "
    assert_not @user.valid? 
  end

end
