# bin/controllers/generateNewCustomTime.rb

require "date"
require_relative "../helpers/roundTimeDown.rb"
require_relative "../models/customTimeModel.rb"

def newCustomTime(conn)
  time_now = DateTime.now

  # round down current time
  time_now_rounded = roundTimeDown(time_now)
  
  # query db for last time recorded
  query = 'SELECT time_custom FROM last_custom_time_stamp ORDER BY id DESC LIMIT 1'
  old_time = retrieveOldCustomTime(conn, query)
  
  if ((time_now_rounded - old_time).empty? == true)
    return nil
  else
    return time_now_rounded
  end
end