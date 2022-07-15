class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :work_days
end
