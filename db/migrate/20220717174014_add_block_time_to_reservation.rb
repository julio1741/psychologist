# frozen_string_literal: true

class AddBlockTimeToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :block_time, null: false, foreign_key: true
  end
end
