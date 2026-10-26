require "test_helper"

class PickupRequestMailerTest < ActionMailer::TestCase
  test "created" do
    pickup_request = pickup_requests(:one)
    mail = PickupRequestMailer.created(pickup_request)

    assert_equal "【粗大回収】新しい依頼が登録されました", mail.subject
    assert_equal [ "delivered@resend.dev" ], mail.to
  end
end
