module DoctorsHelper
  def get_doctor_availability day
    day_date = Date.parse(day).strftime("%A").downcase
    doctor_working_day = get_selected_work_day(day_date)
    return [[], nil] if doctor_working_day.nil?
    [@doctor.block_times, doctor_working_day]
  end

  def get_selected_work_day day
    @doctor.work_days.find_by(name: day)
  end
end
