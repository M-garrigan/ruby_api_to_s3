# bin/models/topGamesStaticModel.rb

# 1) query db for specific game title
def selectGameIfAvailable(conn, query)
  result = conn.exec(query)
  result_arr = result.values
  
  if (result_arr[0].class == 'NilClass')
    return nil
  else
    return result_arr[0]
  end
end

# 2) insert new game into top_games_static table
def insertGameIntoStaticTable(conn, query, game)
  conn.exec(
    query,
    [
      game['game']['_id'],
      game['game']['name'],
      game['game']['box']['template'],
      game['game']['logo']['template']
    ]
  )
end