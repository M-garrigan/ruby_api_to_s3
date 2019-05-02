# bin/models/topGamesStaticModel.rb

# -------------------------------------------------------------------------------
# selectGameIfAvailable
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query {String} -- query for db table 'top_games_static'
#
# @return {nil or Array} -- array (4 strings)
# -------------------------------------------------------------------------------

def selectGameIfAvailable(conn, query)
  result = conn.exec(query)
  result_arr = result.values
  puts('sel ', result_arr[0])
  puts('sel ', result_arr[0].class)
  
  if (result_arr[0].class == 'NilClass')
    return nil
  else
    return result_arr[0]
  end
end

# -------------------------------------------------------------------------------
# insertGameIntoStaticTable
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query {String} -- query for db table 'top_games_static'
# @param game {nil or Array} -- array (4 strings)
#
# @return {none} -- no explicit return 
# -------------------------------------------------------------------------------

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