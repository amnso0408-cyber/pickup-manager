require "test_helper"

class PickupRequestTest < ActiveSupport::TestCase
  test "会社名が空だと無効" do
    pickup_request = pickup_requests(:one)
    pickup_request.company_name = nil

    assert_not pickup_request.valid?
  end

  test "回収日時を設定するとステータスがscheduledになる" do
    pickup_request = pickup_requests(:one)
    pickup_request.scheduled_at = Time.current
    pickup_request.save!

    assert pickup_request.scheduled?
  end
end
