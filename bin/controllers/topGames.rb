# bin/controllers/topGames.rb

require "httparty"
require "json"
require_relative "../helpers/config.rb"
require_relative "../models/topGamesStaticModel.rb"
require_relative "../models/topGamesModel.rb"

def callTwitchApiForTopGames()
  twitch_id = twitch()
  
  res = HTTParty.get(
    "https://api.twitch.tv/kraken/games/top", 
    { 
      headers: { "Client-ID": twitch_id[:"Client-ID"] },
      query: { "limit": 21 }
   }
  )
  res_parsed = JSON.parse(res.body)
  
  if (res_parsed['top'].size > 0)
    return res_parsed['top']
  else 
    return nil
  end
end

      
def handleTopGames(conn, time)
  games = callTwitchApiForTopGames()
  
  if (games) 
    games.each do |game|
      
      game_id = game['game']['_id']
      query = "SELECT * FROM top_games_static WHERE game_id=#{game_id}"
      static_game = selectGameIfAvailable(conn, query)

      if (!static_game) 
        query_static = "INSERT INTO top_games_static (game_id, name, box_art_url, logo_template) VALUES ($1, $2, $3, $4)"
       
        insertGameIntoStaticTable(conn, query_static, game)
      end
    end
  # then add data to db with models/topGamesModel.py
  insertTopGames(conn, games, time) 
  end 
end

  