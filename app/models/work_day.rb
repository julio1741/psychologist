class WorkDay < ApplicationRecord
  has_many :working_days, dependent: :destroy
  has_many :doctors, through: :working_days
  has_many :reservations
end
