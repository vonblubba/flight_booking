# frozen_string_literal: true

FactoryBot.define do
  factory :airplane do
    sequence(:airplane_code) { |n| "airplane_#{n}" }
    description { FFaker::Lorem.sentence }
  end
end
