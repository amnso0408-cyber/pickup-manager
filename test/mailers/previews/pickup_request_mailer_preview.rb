# Preview all emails at http://localhost:3000/rails/mailers/pickup_request_mailer
class PickupRequestMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/pickup_request_mailer/created
  def created
    PickupRequestMailer.created
  end
end
