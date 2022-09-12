# frozen_string_literal: true

module Api
  module V1
    class PassengersController < Api::ApiController
      def index
        passengers = Passenger.created_by_user(current_api_user.id).order(:created_at)

        # TODO: add pagination
        render json: passengers
      end

      def show
        passenger = Passenger.created_by_user(current_api_user.id).find_by_id(params[:id])

        if passenger.present?
          render json: passenger
        else
          render json: { error: "passenger #{params[:id]} not found" }, status: :ok
        end
      end

      def create
        @passenger = Passenger.new(passenger_params)
        @passenger.user_id = current_api_user.id

        if @passenger.save
          render json: @passenger, status: :created
        else
          details = @passenger.errors.full_messages
          render json: { error: 'unable to create passenger', details: details }, status: :bad_request
        end
      end

      def passenger_params
        params.require(:passenger).permit(
          :first_name,
          :last_name,
          :identification_document_code,
          :seat,
          :flight_execution_id
        )
      end
    end
  end
end
