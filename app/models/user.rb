class User < ApplicationRecord
  has_many :pickup_requests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { sales: 0, driver: 1 }
  validates :name, presence: true

  def self.guest_sales
    find_or_create_by!(email: "guest_sales@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "営業ゲスト"
      user.role = :sales
    end
  end

  def self.guest_driver
    find_or_create_by!(email: "guest_driver@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ドライバー部門ゲスト"
      user.role = :driver
    end
  end
end
