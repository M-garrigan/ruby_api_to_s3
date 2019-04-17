#!/usr/local/opt/ruby/bin/ruby
require "pg"
require_relative "helpers/config.rb"



# Entry Point
def handle_main (event, context)
  db = config() 
  puts(db.instance_of?(Hash))
  puts(db.size)
  puts(db.key?(:host))
  begin
  
    conn = PG.connect( # DB connection
      host: db[:host],
      port: db[:port],
      user: db[:user],
      password: db[:password],
      dbname: db[:dbname]
    )


  rescue PG::Error => e
    puts(e.message)

  ensure 
    if conn
      conn.close()
    end

  end

end

handle_main('e', 'c')