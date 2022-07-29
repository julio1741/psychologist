# frozen_string_literal: true

json.array! @block_times, partial: 'block_times/block_time', as: :block_time
