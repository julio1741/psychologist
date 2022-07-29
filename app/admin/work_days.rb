# frozen_string_literal: true

ActiveAdmin.register WorkDay do
  permit_params :name, :day_number
end
