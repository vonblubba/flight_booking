# frozen_string_literal: true

class FlightSerializer < ActiveModel::Serializer
  attributes :id
  attributes :flight_code
  attributes :from_city_code
  attributes :to_city_code
end
