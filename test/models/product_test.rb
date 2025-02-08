require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    # products is a fixture that contains a product with the name "tshirt"
    product = products(:tshirt)

    # Set product out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 10)
    end
  end
end
