# bin/controllers/topStreams.rb

require "httparty"
require "json"
require_relative "./helpers/config.rb"

# -------------------------------------------------------------------------------
# callTwitchApiForTopStreams
#
# @about -- uses Twitch API v5 Kraken, currently there is also the newer Helix
#        -- API but it does not contain all the information that I need.
# 
# @return {Array} -- if the call is sucessfull we will have an array of 
#                        -- hash data for each stream or an empty array.
# -------------------------------------------------------------------------------

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
  
  return res_parsed['streams']
  
end

  