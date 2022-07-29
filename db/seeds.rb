# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hospital_1 = Hospital.find_or_create_by(name: 'Santa Maria')
hospital_2 = Hospital.find_or_create_by(name: 'Integra Médica')

doctor1 = Doctor.find_or_create_by(firstname: 'Lucio', lastname: 'Olivares',
                                   hospital_id: hospital_1.id, phone: '95612365478')
doctor2 = Doctor.find_or_create_by(firstname: 'Jose', lastname: 'Garcia',
                                   hospital_id: hospital_1.id, phone: '95612365478')

doctor3 = Doctor.find_or_create_by(firstname: 'Ricargo', lastname: 'Guillen',
                                   hospital_id: hospital_2.id, phone: '95612365478')
doctor4 = Doctor.find_or_create_by(firstname: 'Antonia', lastname: 'Bravo',
                                   hospital_id: hospital_2.id, phone: '95612365478')

work_day1 = WorkDay.find_or_create_by(name: 'sunday', day_number: 0)
work_day2 = WorkDay.find_or_create_by(name: 'monday', day_number: 1)
work_day3 = WorkDay.find_or_create_by(name: 'tuesday', day_number: 2)
work_day4 = WorkDay.find_or_create_by(name: 'wednesday', day_number: 3)
work_day5 = WorkDay.find_or_create_by(name: 'thursday', day_number: 4)
work_day6 = WorkDay.find_or_create_by(name: 'friday', day_number: 5)
work_day7 = WorkDay.find_or_create_by(name: 'saturday', day_number: 6)

block_time1 = BlockTime.find_or_create_by(start: '8:00', end: '9:00')
block_time2 = BlockTime.find_or_create_by(start: '9:00', end: '10:00')
block_time3 = BlockTime.find_or_create_by(start: '10:00', end: '11:00')
block_time4 = BlockTime.find_or_create_by(start: '11:00', end: '12:00')
block_time5 = BlockTime.find_or_create_by(start: '12:00', end: '13:00')
block_time6 = BlockTime.find_or_create_by(start: '14:00', end: '15:00')
block_time7 = BlockTime.find_or_create_by(start: '15:00', end: '16:00')
block_time8 = BlockTime.find_or_create_by(start: '16:00', end: '17:00')
block_time9 = BlockTime.find_or_create_by(start: '17:00', end: '18:00')
block_time10 = BlockTime.find_or_create_by(start: '18:00', end: '19:00')
block_time11 = BlockTime.find_or_create_by(start: '19:00', end: '20:00')
block_time12 = BlockTime.find_or_create_by(start: '20:00', end: '21:00')
block_time13 = BlockTime.find_or_create_by(start: '21:00', end: '22:00')

doctor1.work_days.clear
doctor1.work_days << work_day1
doctor1.work_days << work_day2
doctor1.work_days << work_day3
doctor1.work_days << work_day4
doctor1.work_days << work_day5
doctor1.work_days << work_day6
doctor1.work_days << work_day7

doctor2.work_days.clear
doctor2.work_days << work_day2
doctor2.work_days << work_day3
doctor2.work_days << work_day4
doctor2.work_days << work_day5
doctor2.work_days << work_day6

doctor3.work_days.clear
doctor3.work_days << work_day2
doctor3.work_days << work_day3
doctor3.work_days << work_day4
doctor3.work_days << work_day5
doctor3.work_days << work_day6

doctor4.work_days.clear
doctor4.work_days << work_day1
doctor4.work_days << work_day2
doctor4.work_days << work_day3
doctor4.work_days << work_day4
doctor4.work_days << work_day5
doctor4.work_days << work_day6
doctor4.work_days << work_day7

doctor1.block_times.clear
doctor1.block_times << block_time1
doctor1.block_times << block_time2
doctor1.block_times << block_time3
doctor1.block_times << block_time4
doctor1.block_times << block_time5

doctor2.block_times.clear
doctor2.block_times << block_time1
doctor2.block_times << block_time2
doctor2.block_times << block_time3
doctor2.block_times << block_time4
doctor2.block_times << block_time5

doctor3.block_times.clear
doctor3.block_times << block_time13
doctor3.block_times << block_time12
doctor3.block_times << block_time11
doctor3.block_times << block_time10
doctor3.block_times << block_time9

doctor4.block_times.clear
doctor4.block_times << block_time13
doctor4.block_times << block_time12
doctor4.block_times << block_time11
doctor4.block_times << block_time10
doctor4.block_times << block_time9

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
