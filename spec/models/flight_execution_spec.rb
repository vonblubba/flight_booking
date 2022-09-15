# frozen_string_literal: true

# == Schema Information
#
# Table name: flight_executions
#
#  id                    :integer          not null, primary key
#  flight_execution_code :string           not null
#  flight_execution_time :datetime         not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  airplane_id           :integer          not null
#  flight_id             :integer          not null
#
# Indexes
#
#  index_flight_executions_on_airplane_id            (airplane_id)
#  index_flight_executions_on_flight_execution_code  (flight_execution_code)
#  index_flight_executions_on_flight_execution_time  (flight_execution_time)
#  index_flight_executions_on_flight_id              (flight_id)
#
require 'rails_helper'

RSpec.describe FlightExecution, type: :model do
  let(:flight) { create(:flight) }
  let(:airplane) { create(:airplane) }

  it 'is valid with valid attributes' do
    flight_execution = FlightExecution.new(
      flight_execution_code: 'fe_code_001',
      flight_execution_time: DateTime.now,
      airplane_id: airplane.id,
      flight_id: flight.id
    )
    expect(flight_execution).to be_valid
  end

  it 'is not valid without a flight_execution_code' do
    flight_execution = FlightExecution.new(
      flight_execution_time: DateTime.now,
      airplane_id: airplane.id,
      flight_id: flight.id
    )
    expect(flight_execution).not_to be_valid
  end

  it 'is not valid without a flight_execution_time' do
    flight_execution = FlightExecution.new(
      flight_execution_code: 'fe_code_001',
      airplane_id: airplane.id,
      flight_id: flight.id
    )
    expect(flight_execution).not_to be_valid
  end

  it 'is not valid without a airplane_id' do
    flight_execution = FlightExecution.new(
      flight_execution_code: 'fe_code_001',
      flight_execution_time: DateTime.now,
      flight_id: flight.id
    )
    expect(flight_execution).not_to be_valid
  end

  it 'is not valid without a flight_id' do
    flight_execution = FlightExecution.new(
      flight_execution_code: 'fe_code_001',
      flight_execution_time: DateTime.now,
      airplane_id: airplane.id,
    )
    expect(flight_execution).not_to be_valid
  end
end
