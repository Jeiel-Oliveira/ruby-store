require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    login
    assert_difference "User.count", 1 do
      post users_path, params: { user: { email_address: "testando.teste@gmail.com", password: "password", password_confirmation: "password" } }
    end
    assert_redirected_to users_path
  end
end
