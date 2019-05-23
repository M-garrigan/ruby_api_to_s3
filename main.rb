# /main.rb

require "aws-sdk-s3"
require "json"
require "time"
require_relative "bin/helpers/config.rb"
require_relative "bin/controllers/formatTime.rb"
require_relative "bin/controllers/topGames.rb"
require_relative "bin/controllers/topStreams.rb"


# Entry Point
def handle_main (event, context)
  s3Config = awsS3()
  
  begin
    s3 = Aws::S3::Client.new(
      region:'us-east-2',
      access_key_id: s3Config[:accessKeyID],
      secret_access_key: s3Config[:secretAccessKey]
    )
    
    # generate timestamp, fetch top games & fetch top streams
    time = formatTime()
    games = callTwitchApiForTopGames()
    streams = callTwitchApiForTopStreams()

    # combine all the data into a hash
    data = {
      time: time,
      games: games,
      streams: streams
    }
    # file name will be epoch (in ms) as a string
    # example "58539349.json"
    epoch = data[:time][:epoch]
    fileName = "#{epoch.to_s}.json"

    file = File.new(fileName, "w")
    file.puts(JSON.generate(data))
    file.close
    
    res = s3.put_object({
      bucket: "watch-me-api-to-s3",
      key: "api/#{fileName}",
      body: JSON.generate(data),
    })

    puts('res: ', res)
  rescue Aws::S3::Errors::ServiceError => err
    puts('S3:Error: ', err)
  end
end

handle_main('e', 'c')