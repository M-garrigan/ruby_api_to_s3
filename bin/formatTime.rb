# bin/controllers/formatTime.rb

def roundMinuteDown (min)
  rem = min % 5
  return min - rem 
end

def formatTime()
  time = Time.now
  
  return {
    time: time, 
    year: time.year(),
    month: time.month(),
    day: time.day(),
    hour: time.hour(),
    minute: roundMinuteDown(time.min())
  }
end