#!/usr/local/opt/ruby/bin/ruby
require "pg"
require_relative "helpers/config.rb"


# Entry Point
def handle_main (event, context)
  
  db = config()

  # DB connection
  conn = PG.connect(
    host: db[:host],
    port: db[:port],
    user: db[:user],
    password: db[:password],
    dbname: db[:dbname]
  )
  
  conn.close()
end

handle_main('e', 'c')