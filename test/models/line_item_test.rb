require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  # TODO: Need to check this after
  test "should increase count of duplicate products in cart" do
    cart = carts(:one)
    product = products(:simple_blue_shirt)

    line_item = cart.add_product(product)
    line_item.save

    assert_equal 2, line_item.quantity
  end
end
