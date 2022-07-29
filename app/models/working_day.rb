# frozen_string_literal: true

class WorkingDay < ApplicationRecord
  belongs_to :doctor
  belongs_to :work_day
end
