# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :controller do
  let!(:user) { create(:user) }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let!(:flight1) { create(:flight) }
  let!(:flight2) { create(:flight) }
  let!(:flight_execution1) { create(:flight_execution, flight_id: flight1.id, flight_execution_time: DateTime.now) }
  let!(:flight_execution2) { create(:flight_execution, flight_id: flight1.id, flight_execution_time: DateTime.now + 2.days) }
  let!(:flight_execution3) { create(:flight_execution, flight_id: flight2.id, flight_execution_time: DateTime.now + 5.days) }

  context '#flight' do
    it 'returns unauthorized if auth header is invalid' do
      request.headers['Authorization'] = 'invalid_token'
      get :flight
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns flight executions according to search params' do
      request.headers['Authorization'] = token
      search_params = {
        from_city_code: flight1.from_city_code,
        to_city_code: flight1.to_city_code,
        min_datetime: DateTime.now + 1.days,
        max_datetime: DateTime.now + 3.days
      }

      get :flight, params: search_params

      expect(response).to have_http_status(:ok)
      js_response = json_response(response)
      expect(js_response.count).to eq 1
      expect(js_response[0]['id']).to eq flight_execution2.id
    end
  end

  def json_response(response)
    JSON.parse(response.body)
  end
end
