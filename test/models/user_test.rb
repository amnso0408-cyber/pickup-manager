require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "nameが空だと無効" do
    user = User.new(name: nil)
    assert_not user.valid?
  end

  test "roleがsalesまたはdriverで設定される" do
    assert User.roles.key?("sales")
    assert User.roles.key?("driver")
  end
end
