# bin/helpers/config.rb

def awsS3 
  s3 = {
    accessKeyID: "access_key_id",
    secretAccessKey: "secret_access_key"
  }
  return s3
end
def twitch
  twitch = {
    "Client-ID": "your_api_key"
  }
  return twitch
end
