require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jeiel)
    @cart = carts(:one)
  end

  test "should not show cart when not authenticated" do
    get cart_url(@cart)
    assert_redirected_to new_session_path
  end

  test "should show cart when authenticated" do
    login
    get cart_url(@cart)
    assert_response :success
  end

  test "should not destroy cart when not authenticated" do
    assert_no_difference("Cart.count") do
      delete cart_url(@cart)
    end
    assert_redirected_to new_session_path
  end

  # TODO: Need to fix this test failing because of the session[:cart_id]
  # test "should destroy cart when authenticated" do
  #   login
  #   session[:cart_id] = @cart.id
  #   assert_difference("Cart.count", -1) do
  #     delete cart_url(@cart)
  #   end
  #   assert_redirected_to root_path
  # end
end
