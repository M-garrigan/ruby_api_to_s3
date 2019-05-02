# bin/models/topStreamsModel.rb

require "pg"

# -------------------------------------------------------------------------------
# assembleQueryForTopStreams
#
# @param conn {PG::Connection} -- the postgres connection
# @param streams {Array} -- array of hashes
#
# @return {Hash} -- signature: {query: String, items: Array of Strings} 
# -------------------------------------------------------------------------------

def assembleQueryForTopStreams(conn, streams) 

  # array order: [channel_id, display_name, language, game, created_at, followers, views, viewers, preview_template]
  items = []  # multidimensional array
  streams.each do |stream|
    item = []
    item.push(stream['channel']['_id'].to_s)
    item.push(stream['channel']['display_name'])
    item.push(stream['channel']['language'].to_s)
    item.push(stream['game'].to_s)
    item.push(stream['created_at'].to_s)
    item.push(stream['channel']['followers'].to_s)
    item.push(stream['channel']['views'])
    item.push(stream['viewers'].to_s)
    item.push(stream['preview']['template'].to_s)
    items.push(item)
  end

  query = "INSERT INTO top_streams (custom_timestamp, stream_01, stream_02, stream_03, stream_04, stream_05, stream_06, stream_07, stream_08, stream_09, stream_10, stream_11, stream_12, stream_13, stream_14, stream_15, stream_16, stream_17, stream_18, stream_19, stream_20) VALUES ($1::int[], $2::text[], $3::text[], $4::text[], $5::text[], $6::text[], $7::text[], $8::text[], $9::text[], $10::text[], $11::text[], $12::text[], $13::text[], $14::text[], $15::text[], $16::text[], $17::text[], $18::text[], $19::text[], $20::text[], $21::text[])"

  return {query: query, items: items}
end

# -------------------------------------------------------------------------------
# insertTopStreams
# 
# @param conn {PG::Connection} -- the postgres connection
# @param streams {Array} -- array of hashes
# @param time {Array} -- array of 5 ints,  signature: [yr, mo, day, hr, min]
#
# @return {none} -- no explicit return 
# -------------------------------------------------------------------------------

def insertTopStreams(conn, streams, time)
  result = assembleQueryForTopStreams(conn, streams)
  items = result[:items]
  conn.exec(
    result[:query],
    [
      PG::TextEncoder::Array.new.encode(time),
      PG::TextEncoder::Array.new.encode(items[0]),
      PG::TextEncoder::Array.new.encode(items[1]),
      PG::TextEncoder::Array.new.encode(items[2]),
      PG::TextEncoder::Array.new.encode(items[3]),
      PG::TextEncoder::Array.new.encode(items[4]),
      PG::TextEncoder::Array.new.encode(items[5]),
      PG::TextEncoder::Array.new.encode(items[6]),
      PG::TextEncoder::Array.new.encode(items[7]),
      PG::TextEncoder::Array.new.encode(items[8]),
      PG::TextEncoder::Array.new.encode(items[9]),
      PG::TextEncoder::Array.new.encode(items[10]),
      PG::TextEncoder::Array.new.encode(items[11]),
      PG::TextEncoder::Array.new.encode(items[12]),
      PG::TextEncoder::Array.new.encode(items[13]),
      PG::TextEncoder::Array.new.encode(items[14]),
      PG::TextEncoder::Array.new.encode(items[15]),
      PG::TextEncoder::Array.new.encode(items[16]),
      PG::TextEncoder::Array.new.encode(items[17]),
      PG::TextEncoder::Array.new.encode(items[18]),
      PG::TextEncoder::Array.new.encode(items[19])
    ]
  )
end