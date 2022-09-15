# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < Api::ApiController
      skip_before_action :authenticate_request

      def authenticate
        token = authenticate_user(params[:email], params[:password])

        if token.present?
          render json: { auth_token: token }
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
