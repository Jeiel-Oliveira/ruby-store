require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get show" do
    get product_url(products(:furry_pikachu))
    assert_select "h1", "Furry Pikachu"
    assert_response :success
  end

  test "should get new" do
    login
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    login
    assert_difference("Product.count") do
      post products_url, params: { product: { name: "New Product", description: "New Product Description", price: 19.99, inventory_count: 1 } }
    end
    assert_redirected_to product_url(Product.last)
  end

  test "should not create product when not authenticated" do
    assert_no_difference("Product.count") do
      post products_url, params: { product: { name: "New Product", description: "New Product Description", price: 19.99, inventory_count: 1 } }
    end
    assert_redirected_to new_session_path
  end

  test "should show product" do
    get product_url(products(:furry_pikachu))
    assert_response :success
  end

  test "should get edit" do
    login
    get edit_product_url(products(:furry_pikachu))
    assert_response :success
  end

  test "should not get edit when not authenticated" do
    get edit_product_url(products(:furry_pikachu))
    assert_redirected_to new_session_path
  end

  test "should update product" do
    login
    patch product_url(products(:furry_pikachu)), params: { product: { name: "Updated Title", description: "Updated Description", price: 29.99 } }
    assert_redirected_to product_url(products(:furry_pikachu))
  end

  test "should not update product when not authenticated" do
    patch product_url(products(:furry_pikachu)), params: { product: { name: "Updated Title", description: "Updated Description", price: 29.99 } }
    assert_redirected_to new_session_path
  end

  test "should destroy product" do
    login
    assert_difference("Product.count", -1) do
      delete product_url(products(:product_without_line_items))
    end
    assert_redirected_to products_url
  end

  test "cannot be deleted when associated with line items" do
    product = products(:furry_pikachu)

    assert_no_difference "Product.count" do
      product.destroy
    end

    assert_includes product.errors.full_messages, I18n.t("products.errors.line_items_present")
  end

  test "should not destroy product when not authenticated" do
    assert_no_difference("Product.count") do
      delete product_url(products(:simple_blue_shirt))
    end
    assert_redirected_to new_session_path
  end
end
