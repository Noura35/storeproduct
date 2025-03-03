require "test_helper"

class ShoppingCartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shopping_cart_items_create_url
    assert_response :success
  end

  test "should get update" do
    get shopping_cart_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shopping_cart_items_destroy_url
    assert_response :success
  end
end
