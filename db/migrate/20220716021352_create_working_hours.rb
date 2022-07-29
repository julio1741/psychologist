# frozen_string_literal: true

class CreateWorkingHours < ActiveRecord::Migration[7.0]
  def change
    create_table :working_hours do |t|
      t.belongs_to :doctor, null: false, foreign_key: true
      t.belongs_to :block_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
