require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  setup do
    @line_item = line_items(:one)
    @cart = carts(:one)
  end

  test "visiting the index" do
    visit line_items_url
    assert_selector "h1", text: "Line items"
  end

  test "should create line item" do
    visit line_items_url
    click_on "New line item"

    fill_in "Cart", with: @line_item.cart_id
    fill_in "Product", with: @line_item.product_id
    click_on "Create Line item"

    assert_text "Line item was successfully created"
    click_on "Back"
  end

  test "should update Line item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy Line item" do
    visit line_item_url(@line_item)
    click_on "Destroy this line item", match: :first

    assert_text "Line item was successfully destroyed"
  end
end
