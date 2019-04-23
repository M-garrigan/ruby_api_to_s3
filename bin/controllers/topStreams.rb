# bin/controllers/topStreams.rb

require "httparty"
require "json"
require_relative "../helpers/config.rb"
require_relative "../models/topStreamsStaticModel.rb"
require_relative "../models/topStreamsModel.rb"

def callTwitchApiForTopStreams()
  twitch_id = twitch()
  
  res = HTTParty.get(
    "https://api.twitch.tv/kraken/streams", 
    { 
      headers: { "Client-ID": twitch_id[:"Client-ID"] },
      query: { "limit": 21 }
   }
  )
  res_parsed = JSON.parse(res.body)
  
  if (res_parsed['streams'].size > 0)
    return res_parsed['streams']
  else 
    return nil
  end
end

      
def handleTopStreams(conn, time)
  streams = callTwitchApiForTopStreams() # returns array of 20 streams or nil
  
  if (streams) 
    streams.each do |stream|
      stream_id = stream['channel']['_id'].to_i
      query = "SELECT * FROM top_streams_static WHERE user_id=#{stream_id}"
      static_stream = selectStreamIfAvailable(conn, query)

      if (!static_stream) 
        query_static = "INSERT INTO top_streams_static (user_name, name, language, created_at, logo, url, user_id) VALUES ($1, $2, $3, $4, $5, $6, $7)"
       
        insertStreamIntoStaticTable(conn, query_static, stream)
      end
    end
  # then add data to db with models/topStreamsModel.py
  insertTopStreams(conn, streams, time) 
  end 
end

  