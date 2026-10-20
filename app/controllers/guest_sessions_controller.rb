class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def sales
    sign_in User.guest_sales
    redirect_to pickup_requests_path, notice: "営業ゲストとしてログインしました"
  end

  def driver
    sign_in User.guest_driver
    redirect_to pickup_requests_path, notice: "ドライバー部門ゲストとしてログインしました"
  end
end
