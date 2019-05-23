# bin/controllers/formatTime.rb


def formatTime()
  time = Time.now
  epoch = time.to_i
  
  return {time: time, epoch: epoch}
end