# bin/models/topGamesModel.rb

require "pg"

def assembleQueryForTopGames(conn, games) 

  # array order: [_id, name, channels, viewers, popularity]
  items = []  # multidimensional array
  games.each do |game|
    item = []
    item.push(game['game']['_id'].to_s)
    item.push(game['game']['name'])
    item.push(game['channels'].to_s)
    item.push(game['viewers'].to_s)
    item.push(game['game']['popularity'].to_s)
    items.push(item)
  end

  query = "INSERT INTO top_games (custom_timestamp, game_01, game_02, game_03, game_04, game_05, game_06, game_07, game_08, game_09, game_10, game_11, game_12, game_13, game_14, game_15, game_16, game_17, game_18, game_19, game_20) VALUES ($1::int[], $2::text[], $3::text[], $4::text[], $5::text[], $6::text[], $7::text[], $8::text[], $9::text[], $10::text[], $11::text[], $12::text[], $13::text[], $14::text[], $15::text[], $16::text[], $17::text[], $18::text[], $19::text[], $20::text[], $21::text[])"

  return {query: query, items: items}
end

def insertTopGames(conn, games, time)
  result = assembleQueryForTopGames(conn, games)
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