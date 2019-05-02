# bin/controllers/generateNewCustomTime.rb

require "date"
require_relative "../helpers/roundTimeDown.rb"
require_relative "../models/customTimeModel.rb"

# -------------------------------------------------------------------
# newCustomTime 
# 
# @param conn {PG::Connection} -- the postgres connection
#
# @return {nil or array} -- we want to ensure the cron job is not
#                        -- running too quickly and if it is we will
#                        -- return nill and not make the api calls.
# -------------------------------------------------------------------

def newCustomTime(conn)
  
  time_now = DateTime.now

  time_now_rounded = roundTimeDown(time_now)
  
  # query db for last time recorded
  query = 'SELECT time_custom FROM last_custom_time_stamp ORDER BY id DESC LIMIT 1'
  old_time = retrieveOldCustomTime(conn, query)

  if (time_now_rounded.eql?(old_time))
    return nil
  else
    return time_now_rounded
  end
end