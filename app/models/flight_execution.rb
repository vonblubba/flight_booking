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
class FlightExecution < ApplicationRecord
  belongs_to :airplane
  belongs_to :flight
  has_many   :passengers

  validates :flight_execution_code, presence: true, uniqueness: true
  validates :airplane_id, presence: true
  validates :flight_id, presence: true
  validates :flight_execution_time, presence: true
end
