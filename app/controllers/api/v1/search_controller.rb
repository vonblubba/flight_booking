# frozen_string_literal: true

module Api
  module V1
    class SearchController < Api::ApiController
      def flight
        from_city_code = params['from_city_code']
        to_city_code = params['to_city_code']

        # if no dates provided, we perform the search on a 30 days interval
        min_datetime = params['min_datetime'] || DateTime.now
        max_datetime = params['max_datetime'] || DateTime.now + 1.month

        # TODO: implement some params consistency check (e.g. min_datetime < max_datetime)

        flight_executions = FlightExecution.includes(:flight)
        flight_executions = flight_executions.where(flight: { from_city_code: from_city_code }) unless from_city_code.nil?
        flight_executions = flight_executions.where(flight: { to_city_code: to_city_code }) unless to_city_code.nil?
        flight_executions = flight_executions.where(flight_execution_time: min_datetime..max_datetime) unless max_datetime.nil?

        # TODO: add pagination
        render json: flight_executions
      end
    end
  end
end
