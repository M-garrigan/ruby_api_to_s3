# bin/models/topStreamsStaticModel.rb

# 1) query db for specific stream id
def selectStreamIfAvailable(conn, query)
  result = conn.exec(query)
  result_arr = result.values
  
  if (result_arr[0].class == 'NilClass')
    return nil
  else
    return result_arr[0]
  end
end

# 2) insert new stream into top_streams_static table
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