# frozen_string_literal: true

# == Schema Information
#
# Table name: flights
#
#  id             :integer          not null, primary key
#  flight_code    :string
#  from_city_code :string           not null
#  to_city_code   :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_flights_on_flight_code                      (flight_code)
#  index_flights_on_from_city_code                   (from_city_code)
#  index_flights_on_from_city_code_and_to_city_code  (from_city_code,to_city_code) UNIQUE
#  index_flights_on_to_city_code                     (to_city_code)
#
class Flight < ApplicationRecord
  has_many :flight_executions

  validates :flight_code, presence: true, uniqueness: true
  validates :from_city_code, presence: true
  validates :to_city_code, presence: true
  validates :from_city_code, uniqueness: { scope: :to_city_code }
end
