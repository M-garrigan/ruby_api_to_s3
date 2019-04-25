# bin/helpers/config.rb

def config
  db = {
    host: "http_to_db",
    port: 5432,
    user: "your_username",
    password: "your_password",
    dbname: "your_db_name"
  }
  return db
end

def twitch
  twitch = {
    "Client-ID": "your_api_key"
  }
  return twitch
end
