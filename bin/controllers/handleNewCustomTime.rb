# bin/controllers/generateNewCustomTime.rb

require_relative "../models/customTimeModel.rb"

def handleNewCustomTime(conn, time)
  query = "INSERT INTO last_custom_time_stamp (time_custom) VALUES ($1::int[]);"

  insertNewCustomTime(conn, query, time)
end