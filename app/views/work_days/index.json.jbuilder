# frozen_string_literal: true

json.array! @work_days, partial: "work_days/work_day", as: :work_day
