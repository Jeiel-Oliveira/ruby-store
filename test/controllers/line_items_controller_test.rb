require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:jeiel)
    @line_item = line_items(:one)
  end

  test "should not create line_item when not authenticated" do
    assert_no_difference("LineItem.count") do
      post line_items_url, params: { product_id: @line_item.product_id }
    end
    assert_redirected_to new_session_path
  end

  test "should create line_item when authenticated" do
    login
    assert_difference("LineItem.count") do
      post line_items_url, params: { product_id: @line_item.product_id }
    end

    assert_redirected_to cart_url(LineItem.last.cart)
  end

  test "should not update line_item when not authenticated" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to new_session_path
  end

  test "should update line_item when authenticated" do
    login
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to cart_url(@line_item.cart)
  end

  test "should not destroy line_item when not authenticated" do
    assert_no_difference("LineItem.count") do
      delete line_item_url(@line_item)
    end
    assert_redirected_to new_session_path
  end

  test "should destroy line_item when authenticated" do
    login
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end
    assert_redirected_to root_path
  end
end
