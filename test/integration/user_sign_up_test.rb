require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest
  setup do
    User.delete_all
    @user_email = "user_#{Time.now.to_f}_#{rand(1000)}@example.com"
  end

  test "valid sign up" do
    puts User.pluck(:email)
    get new_user_registration_path
    assert_response :success

    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { email: @user_email, password: "password", password_confirmation: "password"} }
      follow_redirect!
    end

    assert_response :success
    assert_not_empty flash[:notice]
    assert_equal root_path, path
  end
end
