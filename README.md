# cron_microservice_ruby

A simple service that gathers data about popular games and top streamers from the Twitch API. The service is executed every 5 minutes and after parsing the retrieved data we insert it into a PostgreSQL database.

## Run Tests

$ bundle exec rspec

## Gems Used

pg -- Our C lib wrapper for working with PostgreSQl database

httparty -- tool to make http calls

rspec - BDD Testing Library

## Postgres DB Schema

#### last_custom_time_stamp

- time_custom integer[] NOT NULL
- id integer NOT NULL PK

#### top_games

- id integer NOT NULL PK
- game_01 text[] NOT NULL
- game_02 text[] NOT NULL
- game_03 text[] NOT NULL
- game_04 text[] NOT NULL
- game_05 text[] NOT NULL
- game_06 text[] NOT NULL
- game_07 text[] NOT NULL
- game_08 text[] NOT NULL
- game_09 text[] NOT NULL
- game_10 text[] NOT NULL
- game_11 text[] NOT NULL
- game_12 text[] NOT NULL
- game_13 text[] NOT NULL
- game_14 text[] NOT NULL
- game_15 text[] NOT NULL
- game_16 text[] NOT NULL
- game_17 text[] NOT NULL
- game_18 text[] NOT NULL
- game_19 text[] NOT NULL
- game_20 text[] NOT NULL

#### top_streams

- id integer NOT NULL PK
- stream_01 text[] NOT NULL
- stream_02 text[] NOT NULL
- stream_03 text[] NOT NULL
- stream_04 text[] NOT NULL
- stream_05 text[] NOT NULL
- stream_06 text[] NOT NULL
- stream_07 text[] NOT NULL
- stream_08 text[] NOT NULL
- stream_09 text[] NOT NULL
- stream_10 text[] NOT NULL
- stream_11 text[] NOT NULL
- stream_12 text[] NOT NULL
- stream_13 text[] NOT NULL
- stream_14 text[] NOT NULL
- stream_15 text[] NOT NULL
- stream_16 text[] NOT NULL
- stream_17 text[] NOT NULL
- stream_18 text[] NOT NULL
- stream_19 text[] NOT NULL
- stream_20 text[] NOT NULL

#### top_games_static

- game_id integer NOT NULL PK
- name text NOT NULL
- box_art_url text NOT NULL
- logo_template text NOT NULL

#### top_streams_static

- user_id integer NOT NULL PK
- user_name text NOT NULL
- name text NOT NULL
- language text NOT NULL
- created_at text NOT NULL
- logo text NOT NULL
- url text NOT NULL