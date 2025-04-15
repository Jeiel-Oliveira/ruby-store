require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    # products is a fixture that contains a product with the name "furry_pikachu"
    product = products(:furry_pikachu)

    # Set product out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 10)
    end
  end

  test "cannot be deleted when associated with line items" do
    product = products(:furry_pikachu)
    cart = Cart.create
    cart.add_product(product)

    assert_no_difference "Product.count" do
      product.destroy
    end

    assert_includes product.errors.full_messages, I18n.t("products.errors.line_items_present")
  end

  test "can be deleted when not associated with line items" do
    product = products(:product_without_line_items)

    assert_difference "Product.count", -1 do
      product.destroy
    end
  end
end
