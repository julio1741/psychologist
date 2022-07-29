# frozen_string_literal: true

class CreateBlockTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :block_times do |t|
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
