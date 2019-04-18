#!/usr/local/opt/ruby/bin/ruby
require "pg"
require_relative "bin/helpers/config.rb"
require_relative "bin/controllers/generateNewCustomTime.rb"
require_relative "bin/controllers/handleNewCustomTime.rb"
require_relative "bin/controllers/topGames.rb"


# Entry Point
def handle_main (event, context)
  db = config() 
  
  begin
  
    conn = PG.connect( # DB connection
      host: db[:host],
      port: db[:port],
      user: db[:user],
      password: db[:password],
      dbname: db[:dbname]
    )

    time = newCustomTime(conn)
    
    if(time)
      # insert time into db
      handleNewCustomTime(conn, time)

      # Get top games from twitch api and insert into db
      handleTopGames(conn, time)

      # Get top streamers from twitch api and insert into db
      # retrieveTopStreamers(conn, time)
    end

  rescue PG::Error => e
    puts(e.message)

  ensure 
    if conn
      conn.close()
      puts('DB connection closed.')
    end

  end

end

handle_main('e', 'c')