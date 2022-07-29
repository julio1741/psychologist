# frozen_string_literal: true

class AddWorkDayToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :work_day, null: false, foreign_key: true
  end
end
