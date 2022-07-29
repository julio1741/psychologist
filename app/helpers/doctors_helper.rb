module DoctorsHelper
  def doctor_availability(day, doctor)
    day_date = Date.parse(day).strftime("%A").downcase
    doctor_working_day = selected_work_day(day_date, doctor)
    return [[], nil] if doctor_working_day.nil?

    # remove reserved block times
    reservations = Reservation.joins(:doctor, :block_time, :work_day).where(doctor_id: doctor.id,
                                                                            work_day: { name: day_date })
    reserved_block_times = reservations.map(&:block_time)
    [(doctor.block_times - reserved_block_times), doctor_working_day]
  end

  def selected_work_day(day, doctor)
    doctor.work_days.find_by(name: day)
  end
end
