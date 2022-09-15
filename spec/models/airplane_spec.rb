# frozen_string_literal: true

# == Schema Information
#
# Table name: airplanes
#
#  id            :integer          not null, primary key
#  airplane_code :string           not null
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_airplanes_on_airplane_code  (airplane_code)
#
require 'rails_helper'

RSpec.describe Airplane, type: :model do
  it 'is valid with valid attributes' do
    airplane = Airplane.new(airplane_code: 'airplane_001')
    expect(airplane).to be_valid
  end

  it 'is not valid without an airplane_code' do
    airplane = Airplane.new
    expect(airplane).not_to be_valid
  end
end
