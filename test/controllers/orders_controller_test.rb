require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get cnfirm" do
    get orders_cnfirm_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

  test "should get done" do
    get orders_done_url
    assert_response :success
  end

  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

end
