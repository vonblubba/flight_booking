FROM ruby:3.0.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /flight_booking
WORKDIR /flight_booking
ADD Gemfile /flight_booking/Gemfile
ADD Gemfile.lock /flight_booking/Gemfile.lock
RUN bundle install
ADD . /flight_booking
EXPOSE 3000