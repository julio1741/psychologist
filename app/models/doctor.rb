class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :working_days, dependent: :destroy
  has_many :work_days, through: :working_days
end

