# == Schema Information
#
# Table name: passengers
#
#  id                           :integer          not null, primary key
#  first_name                   :string           not null
#  identification_document_code :string           not null
#  last_name                    :string           not null
#  seat                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  flight_execution_id          :integer          not null
#  user_id                      :integer          not null
#
# Indexes
#
#  index_passengers_on_first_name           (first_name)
#  index_passengers_on_flight_execution_id  (flight_execution_id)
#  index_passengers_on_last_name            (last_name)
#  index_passengers_on_user_id              (user_id)
#
require 'rails_helper'

RSpec.describe Passenger, type: :model do
  let(:flight_execution) { create(:flight_execution) }
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      identification_document_code: 'SUDFYDHHSHSG',
      seat: '1B',
      flight_execution_id: flight_execution.id,
      user_id: user.id
    )
    expect(passenger).to be_valid
  end

  it 'is not valid without a first name' do
    passenger = Passenger.new(
      last_name: 'Lebowski',
      identification_document_code: 'SUDFYDHHSHSG',
      seat: '1B',
      flight_execution_id: flight_execution.id,
      user_id: user.id
    )
    expect(passenger).not_to be_valid
  end

  it 'is not valid without a last name' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      identification_document_code: 'SUDFYDHHSHSG',
      seat: '1B',
      flight_execution_id: flight_execution.id,
      user_id: user.id
    )
    expect(passenger).not_to be_valid
  end

  it 'is not valid without a seat' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      identification_document_code: 'SUDFYDHHSHSG',
      flight_execution_id: flight_execution.id,
      user_id: user.id
    )
    expect(passenger).not_to be_valid
  end

  it 'is not valid without an identification_document_code' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      seat: '1B',
      flight_execution_id: flight_execution.id,
      user_id: user.id
    )
    expect(passenger).not_to be_valid
  end

  it 'is not valid without a flight_execution_id' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      identification_document_code: 'SUDFYDHHSHSG',
      seat: '1B',
      user_id: user.id
    )
    expect(passenger).not_to be_valid
  end

  it 'is not valid without a user_id' do
    passenger = Passenger.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      identification_document_code: 'SUDFYDHHSHSG',
      seat: '1B',
      flight_execution_id: flight_execution.id
    )
    expect(passenger).not_to be_valid
  end
end
