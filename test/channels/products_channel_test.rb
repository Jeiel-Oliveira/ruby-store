require "test_helper"

class ProductsChannelTest < ActionCable::Channel::TestCase
  test "subscribes and streams for product updates" do
    subscribe
    assert subscription.confirmed?
    assert_has_stream "products"
  end

  test "broadcasts product updates" do
    product = products(:furry_pikachu)
    data = {
      action: "product_updated",
      product: {
        id: product.id,
        name: product.name,
        description: product.description.body.to_s,
        price: product.price,
        inventory_count: product.inventory_count
      }
    }

    assert_broadcasts "products", 1 do
      ActionCable.server.broadcast "products", data
    end
  end
end
