# frozen_string_literal: true

class AddHospitalToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctors, :hospital, null: false, foreign_key: true
  end
end
