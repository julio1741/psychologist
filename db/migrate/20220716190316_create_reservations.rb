# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone
      t.datetime :day
      t.string :rut
      t.string :email

      t.timestamps
    end
  end
end
