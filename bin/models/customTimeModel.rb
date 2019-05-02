# bin/models/customTimeModel.rb

require "pg"

# -------------------------------------------------------------------------------
# retrieveOldCustomTime 
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query {String} -- query for db table 'last_custom_time_stamp'
#
# @return {Array} -- array (5 ints) signature: [yr, mo, day, hr, min]
# -------------------------------------------------------------------------------

def retrieveOldCustomTime(conn, query)
  result = conn.exec(query)

  string = result.getvalue(0,0)
  string.gsub!("{", "") # mutates string
  string.gsub!("}", "") # mutates string
  arr = string.split(",")

  intArray = [] 

  arr.each do |x|
    intArray.push(x.to_i)
  end
  
  return intArray
end

# -------------------------------------------------------------------------------
# insertNewCustomTime
# 
# @param conn {PG::Connection} -- the postgres connection
# @param query {String} -- query for db table 'last_custom_time_stamp'
# @param time {Array} -- array of 5 ints,  signature: [yr, mo, day, hr, min]
#
# @return {none} -- no explicit return 
# -------------------------------------------------------------------------------

def insertNewCustomTime(conn, query, time)
  conn.exec(
    query, 
    [PG::TextEncoder::Array.new.encode(time)]
  )
end