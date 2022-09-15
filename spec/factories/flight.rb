# frozen_string_literal: true

FactoryBot.define do
  factory :flight do
    sequence(:flight_code) { |n| "flight_#{n}" }
    from_city_code { FFaker::Lorem.characters(3) }
    to_city_code { FFaker::Lorem.characters(3) }
  end
end
