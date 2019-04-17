# bin/generateNewCustomTime.rb

require "date"
require_relative "../helpers/roundTimeDown.rb"

def newCustomTime(conn)
  time_now = DateTime.now
  puts time_now

  # round down current time
  time_now_rounded = roundTimeDown(time_now)
  puts time_now_rounded
  puts time_now_rounded.class
  # query db for last time recorded
  # old_time = retrieveOldCustomTime(dbConnection, cursor)

  # if (time_now_rounded == old_time): 
  #   return False
  # else: 
  #   return time_now_rounded
end