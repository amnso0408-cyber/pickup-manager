require "test_helper"

class PickupRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pickup_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get pickup_requests_show_url
    assert_response :success
  end

  test "should get new" do
    get pickup_requests_new_url
    assert_response :success
  end

  test "should get edit" do
    get pickup_requests_edit_url
    assert_response :success
  end
end
