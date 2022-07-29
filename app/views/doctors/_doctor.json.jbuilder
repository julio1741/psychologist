# frozen_string_literal: true

json.extract! doctor, :id, :firstname, :lastname, :phone, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
