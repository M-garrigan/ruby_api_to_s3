# bin/controllers/generateNewCustomTime.rb

require_relative "../models/customTimeModel.rb"

# -------------------------------------------------------------------------------
# handleNewCustomTime 
# 
# @param conn {PG::Connection} -- the postgres connection
# @param time {Array} -- time array that we will check to verify 5 mins passed
#
# @return {none} -- no explicit return 
# -------------------------------------------------------------------------------


def handleNewCustomTime(conn, time)
  query = "INSERT INTO last_custom_time_stamp (time_custom) VALUES ($1::int[]);"

  value = insertNewCustomTime(conn, query, time)
end