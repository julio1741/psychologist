# frozen_string_literal: true

class CreateWorkDays < ActiveRecord::Migration[7.0]
  def change
    create_table :work_days do |t|
      t.string :name
      t.integer :day_number

      t.timestamps
    end
  end
end
