# frozen_string_literal: true

class Hospital < ApplicationRecord
  has_many :doctors
end
