# frozen_string_literal: true

class AddUserToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
  end
end
