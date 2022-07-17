module DoctorsHelper
  def get_working_blocks_hours_by_day doctor, day
    day_date = Date.parse(day).strftime("%A").downcase
    doctor_working_days = doctor.work_days.map(&:name)
    return [] unless doctor_working_days.include?(day_date)
    doctor.block_times
  end
end
