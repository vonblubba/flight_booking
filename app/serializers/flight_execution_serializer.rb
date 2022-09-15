# frozen_string_literal: true

class FlightExecutionSerializer < ActiveModel::Serializer
  attributes :id
  attributes :flight_execution_code
  attributes :flight_execution_time
  attributes :flight

  belongs_to :flight, include_nested_associations: true
end
