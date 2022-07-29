# frozen_string_literal: true

require "rails_helper"
RSpec.describe Reservation, :type => :model do
  subject(:user) do
    User.create(username: "Maria", email: "a@a.com")
  end

  subject(:block_time) do
    BlockTime.create(start: '8:00', end: '9:00')
  end

  subject(:work_day) do
    WorkDay.create(name: 'sunday', day_number: 0)
  end

  subject(:hospital) do
    Hospital.create(name: 'Integra Médica')
  end

  subject(:doctor) do
    Doctor.create(firstname: 'Antonia', lastname: 'Bravo', hospital_id: hospital.id,
                  phone: '95612365478')
  end

  subject(:reservation) do
    described_class.new(
      firstname: "Julio",
      rut: "25176838-2",
      email: user.email,
      doctor_id: doctor.id,
      work_day_id: work_day.id,
      day: '2022-07-26',
      phone: '95612365478',
      block_time_id: block_time.id,
      user: user
    )
  end

  describe 'reservation' do
    it "is valid with attributes" do
      expect(reservation).to be_valid
    end

    it "is not valid without firstname" do
      reservation.firstname = nil
      expect(reservation).to_not be_valid
    end

    it "is not valid with wrong rut" do
      reservation.rut = "1111"
      expect(reservation).to_not be_valid
    end

    it "belongs to a block_time" do
      expect(reservation.block_time.class).to be BlockTime
    end

    it "belongs to a doctor" do
      expect(reservation.doctor.class).to be Doctor
    end

    it "belongs to a work_day" do
      expect(reservation.work_day.class).to be WorkDay
    end

    it "belongs to a user" do
      expect(reservation.user.class).to be User
    end
  end
end
