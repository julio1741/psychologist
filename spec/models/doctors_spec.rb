require "rails_helper" 
RSpec.describe Doctor, :type => :model do
    subject(:hospital) do
    Hospital.create(name: 'Integra Médica')
    end

  subject(:block_time) do
    BlockTime.create(start:'8:00', end:'9:00')
  end

  subject(:work_day) do
    WorkDay.create(name: 'monday', day_number:0)
  end

  subject(:doctor) do
    Doctor.create(firstname: 'Antonia', lastname: 'Bravo', hospital_id: hospital.id, phone: '95612365478')
  end

  describe 'doctor' do
    it "is valid with attributes" do
      expect(doctor).to be_valid
    end
  end


  describe DoctorsHelper, type: :helper do
   describe '#get_doctor_availability' do

      it 'returns a block_time' do
        doctor.work_days << work_day
        doctor.block_times << block_time
        day = '2022-07-18'
        block_times, work_day = helper.get_doctor_availability(day, doctor)
        expect(block_times.size).to be >= 1
      end

      it 'returns a work day' do
        expect(work_day.name).to be == 'monday'
      end
   end
  end
end