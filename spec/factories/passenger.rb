# frozen_string_literal: true

FactoryBot.define do
  factory :passenger do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    identification_document_code { FFaker::Lorem.characters(10) }
    seat { FFaker::Lorem.characters(3) }
    association :flight_execution, factory: :flight_execution
    association :user, factory: :user
  end
end
