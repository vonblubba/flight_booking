# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(
  first_name: 'Oscar',
  last_name: 'Riva',
  email: 'oscar.riva@gmail.com',
  password: 'pwdprova',
  password_confirmation: 'pwdprova'
)

a1 = Airplane.create(
  airplane_code: 'airplane_code_000',
  description: 'airplane 000'
)

a2 = Airplane.create(
  airplane_code: 'airplane_code_001',
  description: 'airplane 001'
)

f1 = Flight.create(
  flight_code: 'flight_000',
  from_city_code: 'FCO',
  to_city_code: 'MXP'
)

f2 = Flight.create(
  flight_code: 'flight_001',
  from_city_code: 'VRN',
  to_city_code: 'PMO'
)

fe1 = FlightExecution.create(
  flight_execution_code: 'fe_000',
  flight_execution_time: DateTime.now,
  airplane_id: a1.id,
  flight_id: f1.id
)

fe2 = FlightExecution.create(
  flight_execution_code: 'fe_001',
  flight_execution_time: DateTime.tomorrow,
  airplane_id: a2.id,
  flight_id: f2.id
)

Passenger.create(
  first_name: 'Oscar',
  identification_document_code: 'ASDEDDFASDEFF',
  last_name: 'Riva',
  seat: '1B',
  flight_execution_id: fe1.id,
  user_id: u1.id
)

Passenger.create(
  first_name: 'Jeffrey',
  identification_document_code: 'SDTYTDIUIJSYY',
  last_name: 'Lebowski',
  seat: '23D',
  flight_execution_id: fe2.id,
  user_id: u1.id
)
