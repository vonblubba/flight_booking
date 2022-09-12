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
require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:flight1) { create(:flight) }

  it 'is valid with valid attributes' do
    flight = Flight.new(flight_code: 'airplane_001', from_city_code: 'RMM', to_city_code: 'FVV')
    expect(flight).to be_valid
  end

  it 'is not valid without a flight_code' do
    flight = Flight.new(from_city_code: 'RMM', to_city_code: 'FVV')
    expect(flight).not_to be_valid
  end

  it 'is not valid without a from_city_code' do
    flight = Flight.new(flight_code: 'airplane_001', to_city_code: 'FVV')
    expect(flight).not_to be_valid
  end

  it 'is not valid without a to_city_code' do
    flight = Flight.new(flight_code: 'airplane_001', from_city_code: 'RMM')
    expect(flight).not_to be_valid
  end

  it 'is not valid without a unique from and to city' do
    flight2 = Flight.new(flight_code: 'airplane_002', from_city_code: flight1.from_city_code, to_city_code: flight1.to_city_code)
    expect(flight2).not_to be_valid
  end
end
