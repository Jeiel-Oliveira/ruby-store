require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    login
    get orders_url
    assert_response :success
  end

  test "should get new" do
    login

    # Create a cart in the session
    post line_items_url, params: { product_id: products(:furry_pikachu).id }

    get new_order_url
    assert_response :success
  end

  test "should create order" do
    login

    # Create a cart in the session
    post line_items_url, params: { product_id: products(:furry_pikachu).id }

    assert_difference("Order.count") do
      post orders_url, params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    end

    assert_redirected_to products_url
  end

  test "should show order" do
    login
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    login
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    login
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    login
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
