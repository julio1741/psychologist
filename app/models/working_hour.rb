# frozen_string_literal: true

class WorkingHour < ApplicationRecord
  belongs_to :doctor
  belongs_to :block_time
end
