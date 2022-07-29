# frozen_string_literal: true

class RutValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    return if RUT.validate(record.rut)

    record.errors.add(:rut, 'invalid')
  end
end
