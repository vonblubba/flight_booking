# frozen_string_literal: true

module Api
  class ApiController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_api_user

    private

    def authenticate_user(email, password)
      user = User.find_by_email(email)
      return nil unless user.present? && user.valid_password?(password)

      JsonWebToken.encode(user_id: user.id)
    end

    def authenticate_request
      authorize_api_request

      render json: { error: 'Unauthorized request' }, status: :unauthorized unless @current_api_user
    end

    def decoded_auth_token
      JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      return request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?

      nil
    end

    def authorize_api_request
      @current_api_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end
  end
end
