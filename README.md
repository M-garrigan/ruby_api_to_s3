# Watch Me Twitch

This is a piece of an application that makes up Watch Me Twitch .com

## What this lambda does.
Aggregates data from the Twitch API about current top games being played and top streamers on the platform. The data then gets JSON formatted and zipped into a file to be sent to a S3 bucket for storage. 

## Architecture
Image goes here.

## Twitch API data
This lambda is hitting the Twitch API for two seperate resources. One is for the top games being played on the platform via https://api.twitch.tv/kraken/games/top. The second is for the top streamers on the platform via https://api.twitch.tv/kraken/streams.

## Gems Used
aws-sdk-s3
httparty -- tool to make http calls
rubyzip 
rspec - BDD Testing Library

<!-- example of a link -- [Git](https://git-scm.com) -->

## How To Use

As this is a Ruby based lambda you should have Ruby, Bundler, Git and Gem installed for you machine.

These instructions will set up for local development

```bash
# Clone this repository
$ git clone https://github.com/M-garrigan/ruby_api_to_s3.git

# Go into the repository
$ cd ruby_api_to_s3

# Install dependencies
$ bundle install

# Run the app
$ ruby main.rb
```

These instructions will set up for AWS lambda upload

```bash
# Clone this repository
$ git clone https://github.com/M-garrigan/ruby_api_to_s3.git

# Go into the repository
$ cd ruby_api_to_s3

# Install dependencies locally
$ bundle install --path="vendor/bundle"

# zip the app
$ zip -r9 app.zip .

# now upload the app.zip through the gui or cli
```


## S3 Bucket Schema
Although S3 storage is a flat file storage system we are mocking out a nested directory structure for our storage.
The directory structure looks like this: 
2019/
  6/
    1/
      metadata.zip
      01_05.zip
      01_10.zip
      01_15.zip
      01_20.zip

## Metadata.zip file anatomy

## Resources & Links
https://github.com/rubyzip/rubyzip
https://docs.aws.amazon.com/sdk-for-ruby/v3/api/