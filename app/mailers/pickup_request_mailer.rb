class PickupRequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pickup_request_mailer.created.subject
  #
  def created(pickup_request)
    @pickup_request = pickup_request
    mail(to: User.pluck(:email), subject: "【粗大回収】新しい依頼が登録されました")
  end

   def updated(pickup_request)
    @pickup_request = pickup_request
    mail(to: User.pluck(:email), subject: "【粗大回収】依頼が更新されました")
  end

   def destroyed(company_name)
    @company_name = company_name
    mail(to: User.pluck(:email), subject: "【粗大回収】依頼が削除されました")
  end
end
