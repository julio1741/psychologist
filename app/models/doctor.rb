class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :working_days, dependent: :destroy
  has_many :work_days, through: :working_days
  accepts_nested_attributes_for :working_days

  has_many :working_hours, dependent: :destroy
  has_many :block_times, through: :working_hours

  has_many :reservations
end

