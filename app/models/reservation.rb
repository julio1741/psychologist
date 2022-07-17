class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :block_time
  belongs_to :work_day
end
