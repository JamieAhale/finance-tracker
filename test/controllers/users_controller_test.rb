require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end
  
  test "should get portfolio" do
    get my_portfolio_path
    assert_response :success
  end

  # test "should log out" do
  # end
end
