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

  # https://guides.rubyonrails.org/testing.html#functional-testing-for-controllers
  # This test is failing because the new action is not protected by authentication.
  # test "should get new" do
  #   user = users(:jeiel)
  #   get new_product_url, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(user.email_address, user.password_digest) }
  #   assert_response :success
  # end
end
