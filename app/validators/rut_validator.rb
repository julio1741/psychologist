class RutValidator < ActiveModel::Validator
  require 'chilean_rut'
  def validate(record)
    unless RUT::validate(record.rut)
      record.errors.add(:rut, 'invalid')
    end
  end
end