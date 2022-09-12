# frozen_string_literal: true

class PassengerSerializer < ActiveModel::Serializer
  attribute :id
  attribute :first_name
  attribute :last_name
  attribute :identification_document_code
  attribute :seat
  attribute :flight_execution

  belongs_to :flight_execution, include_nested_associations: true
end
