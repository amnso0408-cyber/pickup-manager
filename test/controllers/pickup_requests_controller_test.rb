require "test_helper"

class PickupRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @pickup_request = pickup_requests(:one)
  end

  test "should get index" do
    get pickup_requests_url
    assert_response :success
  end

  test "should get show" do
    get pickup_request_url(@pickup_request)
    assert_response :success
  end

  test "should get new" do
    get new_pickup_request_url
    assert_response :success
  end

  test "should get edit" do
    get edit_pickup_request_url(@pickup_request)
    assert_response :success
  end
end
