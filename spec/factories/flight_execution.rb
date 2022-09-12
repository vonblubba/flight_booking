# frozen_string_literal: true

FactoryBot.define do
  factory :flight_execution do
    sequence(:flight_execution_code) { |n| "flight_execution_code_#{n}" }
    flight_execution_time { DateTime.now }
    association :airplane, factory: :airplane
    association :flight, factory: :flight
  end
end
