# frozen_string_literal: true

json.extract! work_day, :id, :name, :day_number, :created_at, :updated_at
json.url work_day_url(work_day, format: :json)
