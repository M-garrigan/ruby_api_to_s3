# /main.rb

require "aws-sdk-s3"
require "json"
require "time"
require "zip"
require_relative "bin/helpers/config.rb"
require_relative "bin/formatTime.rb"
require_relative "bin/topGames.rb"
require_relative "bin/topStreams.rb"

# TODO
# 1) make a template for a metadata.zip file to add to the S3 day directory
#   a) Only add the metadata.zip file on the first entry for the day
#   b) Then just update the file into an array
# 2) Fill out README.md file so that it is useful


# Entry Point
def handle_main (event, context)
  s3Config = awsS3()
  
  begin
    s3 = Aws::S3::Client.new(
      region:'us-east-2',
      access_key_id: s3Config[:accessKeyID],
      secret_access_key: s3Config[:secretAccessKey]
    )
    
    # generate data to be stored in s3 bucket
    time = formatTime()
    games = callTwitchApiForTopGames()
    streams = callTwitchApiForTopStreams()
    
    # aggregate data into a hash
    data = {
      time: time,
      games: games,
      streams: streams,
    }

    # directory & file name variables
    year = time[:year]
    month = time[:month]
    day = time[:day]
    hour = time[:hour]
    minute = time[:minute]

    # create .json file to place JSON formatted data
    file = File.new("#{hour}_#{minute}.json", "w")
    file.puts(JSON.generate(data))
    file.close
    
    # zip the file
    fileName = "#{hour}_#{minute}.zip"
    Zip::File.open(File.join(Dir.pwd, fileName), Zip::File::CREATE) do |zipfile|
      ["#{hour}_#{minute}.json"].each do |file|
        zipfile.add(file, File.join(Dir.pwd, file))
      end
    end

    # send the zipped file to S3
    # res = s3.put_object({
    #   bucket: "watch-me-api-to-s3",
    #   key: "#{year}/#{month}/#{day}/#{fileName}",
    #   body: JSON.generate(data),
    # })

    # remove the local .zip & .json files
    File.delete("#{hour}_#{minute}.json")
    File.delete("#{hour}_#{minute}.zip")
   
    # puts('res: ', res)
  rescue Aws::S3::Errors::ServiceError => err
    puts('S3:Error: ', err)
  end
end

handle_main('e', 'c')