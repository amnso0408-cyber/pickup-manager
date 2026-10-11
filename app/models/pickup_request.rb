class PickupRequest < ApplicationRecord
  belongs_to :user
  enum :status, { confirmed: 0, scheduled: 1, completed: 2, canceled: 3 }
  validates :company_name, :address, :items, presence: true
end
