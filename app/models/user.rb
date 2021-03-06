# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_many :reservations
  has_secure_password # password validations

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.uid = auth.info.uid if auth.info.uid
      user.password = SecureRandom.hex
    end
  end
end
