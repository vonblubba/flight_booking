# frozen_string_literal: true

# == Schema Information
#
# Table name: passengers
#
#  id                           :integer          not null, primary key
#  first_name                   :string           not null
#  identification_document_code :string           not null
#  last_name                    :string           not null
#  seat                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  flight_execution_id          :integer          not null
#  user_id                      :integer          not null
#
# Indexes
#
#  index_passengers_on_first_name           (first_name)
#  index_passengers_on_flight_execution_id  (flight_execution_id)
#  index_passengers_on_last_name            (last_name)
#  index_passengers_on_user_id              (user_id)
#
class Passenger < ApplicationRecord
  belongs_to :flight_execution
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :identification_document_code, presence: true
  validates :seat, presence: true
  validates :flight_execution_id, presence: true
  validates :user_id, presence: true
  validates :flight_execution_id, uniqueness: { scope: :identification_document_code }
  validates :seat, uniqueness: { scope: :flight_execution_id }

  scope :created_by_user, ->(user_id) { where(user_id: user_id) }
end
