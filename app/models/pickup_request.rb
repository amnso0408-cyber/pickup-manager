class PickupRequest < ApplicationRecord
  belongs_to :user
  validates :company_name, :address, :items, presence: true

  enum :status, { confirmed: 0, scheduled: 1, completed: 2, canceled: 3 }, default: :confirmed
  before_save :set_scheduled_status


  def status_i18n
    self.class.human_attribute_name("status.#{status}")
  end

  private

  def set_scheduled_status
    self.status = :scheduled if scheduled_at.present? && confirmed?
  end

end
