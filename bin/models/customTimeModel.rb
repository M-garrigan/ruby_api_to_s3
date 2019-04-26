# bin/models/customTimeModel.rb

require "pg"

def retrieveOldCustomTime(conn, query)
  result = conn.exec(query)

  string = result.getvalue(0,0)
  string.gsub!("{", "") # mutates string
  string.gsub!("}", "") # mutates string
  arr = string.split(",")

  arr.each do |x|
    x.to_i
  end

  return arr
end


def insertNewCustomTime(conn, query, time)
  conn.exec(
    query, 
    [PG::TextEncoder::Array.new.encode(time)]
  )
end