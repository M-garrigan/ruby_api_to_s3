# bin/models/topStreamsStaticModel.rb

# -------------------------------------------------------------------------------
# selectStreamIfAvailable
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query {String} -- query for db table 'top_games_static'
#
# @return {nil or Array} -- array (4 strings)
# -------------------------------------------------------------------------------

def selectStreamIfAvailable(conn, query)
  result = conn.exec(query)
  result_arr = result.values
  
  if (result_arr[0].class == 'NilClass')
    return nil
  else
    return result_arr[0]
  end
end

# -------------------------------------------------------------------------------
# insertStreamIntoStaticTable
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query_static {String} -- query for db table 'top_streams_static'
# @param stream {nil or Array} -- array (4 strings)
#
# @return {none} -- no explicit return 
# -------------------------------------------------------------------------------

def insertStreamIntoStaticTable(conn, query_static, stream)
  conn.exec(
    query_static,
    [
      stream['channel']['display_name'], 
      stream['channel']['name'], 
      stream['channel']['language'], 
      stream['channel']['created_at'], 
      stream['channel']['logo'], 
      stream['channel']['url'],
      stream['channel']['_id']
    ]
  )
end