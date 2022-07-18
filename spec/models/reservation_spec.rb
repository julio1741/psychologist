require "rails_helper" 
RSpec.describe Reservation, :type => :model do
  subject(:user) do
    User.create(username:"Maria", email:"a@a.com")
  end

  subject(:block_time) do
    BlockTime.create(start:'8:00', end:'9:00')
  end

  subject(:work_day) do
    WorkDay.create(name: 'sunday', day_number:0)
  end

  subject(:hospital) do
    Hospital.create(name: 'Integra Médica')
  end

  subject(:doctor) do
    Doctor.create(firstname: 'Antonia', lastname: 'Bravo', hospital_id: hospital.id)
  end

  describe 'reservation' do
    it "is valid with attributes" do
      reservation = Reservation.new(firstname: "Julio", rut: "25176838-2", email: user.email)
      reservation.user = user
      reservation.doctor = doctor
      reservation.work_day = work_day
      reservation.block_time = block_time
      expect(reservation).to be_valid
    end

    #it "is not valid without a title"
    #it "is not valid without a description"
    #it "is not valid without a start_date"
    #it "is not valid without a end_date"
  end
end