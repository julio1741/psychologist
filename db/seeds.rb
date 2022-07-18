# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

hospital_1 = Hospital.find_or_create_by(name: 'Santa Maria')
hospital_2 = Hospital.find_or_create_by(name: 'Integra Médica')


Doctor.find_or_create_by(firstname: 'Lucio', lastname: 'Olivares', hospital_id: hospital_1.id)
Doctor.find_or_create_by(firstname: 'Jose', lastname: 'Garcia', hospital_id: hospital_1.id)

Doctor.find_or_create_by(firstname: 'Ricargo', lastname: 'Guillen', hospital_id: hospital_2.id)
Doctor.find_or_create_by(firstname: 'Antonia', lastname: 'Bravo', hospital_id: hospital_2.id)

WorkDay.find_or_create_by(name: 'sunday', day_number:0)
WorkDay.find_or_create_by(name: 'monday', day_number:1)
WorkDay.find_or_create_by(name: 'tuesday', day_number:2)
WorkDay.find_or_create_by(name: 'wednesday', day_number:3)
WorkDay.find_or_create_by(name: 'thursday', day_number:4)
WorkDay.find_or_create_by(name: 'friday', day_number:5)
WorkDay.find_or_create_by(name: 'saturday', day_number:6)

BlockTime.find_or_create_by(start:'8:00', end:'9:00')
BlockTime.find_or_create_by(start:'9:00', end:'10:00')
BlockTime.find_or_create_by(start:'10:00', end:'11:00')
BlockTime.find_or_create_by(start:'11:00', end:'12:00')
BlockTime.find_or_create_by(start:'12:00', end:'13:00')
BlockTime.find_or_create_by(start:'14:00', end:'15:00')
BlockTime.find_or_create_by(start:'15:00', end:'16:00')
BlockTime.find_or_create_by(start:'16:00', end:'17:00')
BlockTime.find_or_create_by(start:'17:00', end:'18:00')
BlockTime.find_or_create_by(start:'18:00', end:'19:00')
BlockTime.find_or_create_by(start:'19:00', end:'20:00')
BlockTime.find_or_create_by(start:'20:00', end:'21:00')
BlockTime.find_or_create_by(start:'21:00', end:'22:00')