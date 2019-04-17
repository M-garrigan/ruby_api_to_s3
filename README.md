# cron_microservice_ruby

A simple service that gathers data about popular games and top streamers from the Twitch API. The service is executed every 5 minutes and after parsing the retrieved data we insert it into a PostgreSQL database.

## Run Tests

$ bundle exec rspec

## Gems Used

pg -- Our C lib wrapper for working with PostgreSQl database

rspec - BDD Testing Library
