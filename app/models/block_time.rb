class BlockTime < ApplicationRecord
  has_many :working_hours, dependent: :destroy
  has_many :doctors, through: :working_hours
  has_many :reservations
end
