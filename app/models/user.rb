class User < ApplicationRecord

  has_many :preferences

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :last_name, :phone_number, :address, presence: true

end
