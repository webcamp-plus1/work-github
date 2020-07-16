require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carts_create_url
    assert_response :success
  end

  test "should get index" do
    get carts_index_url
    assert_response :success
  end

  test "should get update" do
    get carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get carts_all_destroy_url
    assert_response :success
  end

end
