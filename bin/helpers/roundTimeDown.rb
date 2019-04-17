# bin/helpers/roundTimeDown.rb

require "date"

def roundTimeDown(time)
  
  # round minuite down to nearest 5 min increment
  minute = time.minute
  remainder = minute % 5
  
  return [time.year, time.month, time.day, time.hour, minute - remainder]
end