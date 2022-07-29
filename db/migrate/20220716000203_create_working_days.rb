# frozen_string_literal: true

class CreateWorkingDays < ActiveRecord::Migration[7.0]
  def change
    create_table :working_days do |t|
      t.belongs_to :doctor, null: false, foreign_key: true
      t.belongs_to :work_day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
