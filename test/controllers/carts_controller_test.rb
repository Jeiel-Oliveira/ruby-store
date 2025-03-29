require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jeiel)
    @cart = carts(:one)
  end

  test "should not get index when not authenticated" do
    get carts_url
    assert_redirected_to new_session_path
  end

  test "should get index when authenticated" do
    login
    get carts_url
    assert_response :success
  end

  test "should not get new when not authenticated" do
    get new_cart_url
    assert_redirected_to new_session_path
  end

  test "should get new when authenticated" do
    login
    get new_cart_url
    assert_response :success
  end

  test "should not create cart when not authenticated" do
    assert_no_difference("Cart.count") do
      post carts_url, params: { cart: {} }
    end
    assert_redirected_to new_session_path
  end

  test "should create cart when authenticated" do
    login
    assert_difference("Cart.count") do
      post carts_url, params: { cart: {} }
    end
    assert_redirected_to cart_url(Cart.last)
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

  test "should not get edit when not authenticated" do
    get edit_cart_url(@cart)
    assert_redirected_to new_session_path
  end

  test "should get edit when authenticated" do
    login
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should not update cart when not authenticated" do
    patch cart_url(@cart), params: { cart: {} }
    assert_redirected_to new_session_path
  end

  test "should update cart when authenticated" do
    login
    patch cart_url(@cart), params: { cart: {} }
    assert_redirected_to cart_url(@cart)
  end

  test "should not destroy cart when not authenticated" do
    assert_no_difference("Cart.count") do
      delete cart_url(@cart)
    end
    assert_redirected_to new_session_path
  end

  test "should destroy cart when authenticated" do
    login
    assert_difference("Cart.count", -1) do
      delete cart_url(@cart)
    end
    assert_redirected_to carts_url
  end
end
