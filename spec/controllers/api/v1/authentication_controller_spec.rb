# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :controller do
  let(:password) { 'pwdprova' }
  let(:user) { create(:user, password: password, password_confirmation: password) }

  it 'returns valid token if provided credentials are valid' do
    post :authenticate, params: { email: user.email, password: password }

    expect(json_response(response)['auth_token']).to eq JsonWebToken.encode(user_id: user.id)
  end

  it 'returns unauthorized if provided credentials are invalid' do
    post :authenticate, params: { email: user.email, password: 'wrong_pwd' }

    expect(response).to have_http_status(401)
  end

  def json_response(response)
    JSON.parse(response.body)
  end
end
