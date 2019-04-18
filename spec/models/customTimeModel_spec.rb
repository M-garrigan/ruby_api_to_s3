# spec/models/customTimeModel_spec.rb

require "pg"
require_relative "../../bin/helpers/config.rb"
require_relative "../../bin/models/customTimeModel.rb"
puts PG.class
RSpec.describe 'retrieveOldCustomTime(conn, query)' do 
  db = config() 
  
  begin
    conn = PG.connect( # DB connection
      host: db[:host],
      port: db[:port],
      user: db[:user],
      password: db[:password],
      dbname: db[:dbname]
    )

    query_test = 'SELECT time_custom FROM test_last_custom_time_stamp ORDER BY id DESC LIMIT 1'

    result = retrieveOldCustomTime(conn, query_test)
    value = []
    result.each do |x|
      value.push x.to_i
    end

    it 'should return an array' do
      expect(value.class).to eq(Array)
    end

    it 'should return an array that matches [2020, 12, 25, 6, 30]' do
      expect(value).to eq([2020, 12, 25, 6, 30])
    end

    it 'should return an array of 5 items' do
      expect(value.size).to eq(5)
    end
  
    it 'should return an array of 5 integers' do
      expect(value).to all(be_an(Integer))
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