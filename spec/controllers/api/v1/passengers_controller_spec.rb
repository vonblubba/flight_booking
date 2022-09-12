# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PassengersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:token) { JsonWebToken.encode(user_id: user.id) }
  let!(:passenger1) { create(:passenger, user_id: user.id) }
  let!(:passenger2) { create(:passenger, user_id: user.id) }
  let!(:passenger3) { create(:passenger) }

  context '#index' do
    let(:expected_passenger_ids) { [passenger1.id, passenger2.id] }

    it 'returns unauthorized if auth header is invalid' do
      request.headers['Authorization'] = 'invalid_token'
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns returns all passengers created by caller user' do
      request.headers['Authorization'] = token
      get :index

      expect(response).to have_http_status(:ok)
      js_response = json_response(response)
      expect(js_response.count).to eq 2
      expect(expected_passenger_ids).to include(js_response[0]['id'])
      expect(expected_passenger_ids).to include(js_response[1]['id'])
    end
  end

  context '#create' do
    let(:create_params) do
      {
        passenger: {
          first_name: 'Jeffrey',
          last_name: 'Lebowski',
          identification_document_code: 'doc_code',
          seat: '2B',
          flight_execution_id: passenger1.flight_execution.id
        }
      }
    end

    let(:seat_taken_create_params) do
      {
        passenger: {
          first_name: 'Jeffrey',
          last_name: 'Lebowski',
          identification_document_code: 'doc_code',
          seat: passenger1.seat,
          flight_execution_id: passenger1.flight_execution.id
        }
      }
    end

    let(:invalid_create_params) do
      {
        passenger: {
          first_name: 'Jeffrey',
          last_name: 'Lebowski',
          seat: '2B'
        }
      }
    end

    it 'returns unauthorized if auth header is invalid' do
      request.headers['Authorization'] = 'invalid_token'
      post :create
      expect(response).to have_http_status(:unauthorized)
    end

    it 'creates a passenger if valid params are provided' do
      request.headers['Authorization'] = token
      post :create, params: create_params

      expect(response).to have_http_status(:created)
      js_response = json_response(response)
      expect(js_response['identification_document_code']).to eq 'doc_code'
    end

    it 'returns bad request if invalid params are provided' do
      request.headers['Authorization'] = token
      post :create, params: invalid_create_params

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns bad request if seat already taken' do
      request.headers['Authorization'] = token
      post :create, params: seat_taken_create_params

      expect(response).to have_http_status(:bad_request)
    end
  end

  context '#show' do
    it 'returns unauthorized if auth header is invalid' do
      request.headers['Authorization'] = 'invalid_token'
      get :show, params: { id: passenger1.id }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns returns required passenger' do
      request.headers['Authorization'] = token
      get :show, params: { id: passenger1.id }

      expect(response).to have_http_status(:ok)
      js_response = json_response(response)
      expect(js_response['id']).to eq passenger1.id
    end
  end

  def json_response(response)
    JSON.parse(response.body)
  end
end
