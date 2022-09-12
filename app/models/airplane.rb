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
class Airplane < ApplicationRecord
  has_many :flight_executions

  validates :airplane_code, presence: true, uniqueness: true
end
