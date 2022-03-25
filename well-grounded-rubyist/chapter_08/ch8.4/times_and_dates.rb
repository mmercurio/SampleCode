require 'date'

p Date.parse("April 24 1704").england.strftime("%B %d %Y") # "April 13 1704"

# Creating date objects (year, month, day)
puts Date.today                       # 2022-03-23
puts Date.new(1959, 2, 1)             # 1959-02-01

# Centry expanded by default for two digit years
puts Date.parse("03/6/9")            # 2003-06-09
puts Date.parse("2033-6-9")          # 2033-06-09
puts Date.parse("77/6/9")            # 1977-06-09

# Some non-standard inputs
puts Date.parse("November 2 2013")   # 2013-11-02
puts Date.parse("Nov 2 2013")        # 2013-11-02
puts Date.parse("2013/11/2")         # 2013-11-02

# creating Time objects
require 'time'

# current time
p Time.new                          # 2022-03-23 16:01:24.262076 -0400
p Time.now                          # 2022-03-23 16:01:24.262114 -0400

# Unix time, seconds since the Epoch, midnight on January 1, 1970 GMT
p Time.at(100000000)                # 1973-03-03 04:46:40 -0500

# year, month, day, hour, minute, seconds
p Time.mktime(2007, 10, 30, 14 ,3, 6) # 2007-10-30 14:03:06 -0400
p Time.local(2023, 3, 23, 18, 0, 0) # 2023-03-23 18:00:00 -0400
p Time.local(2023, 3, 23)           # 2023-03-23 00:00:00 -0400
p Time.parse("October 26, 1985, 1:20:00 AM") # 1985-10-26 01:20:00 -0400

puts DateTime.new(2009, 1, 2, 3, 4, 5)  # 2009-01-02T03:04:05+00:00
puts DateTime.now                       # 2022-03-23T16:17:15-04:00
puts DateTime.parse("November 5, 1955, 6:15 AM") # 1955-11-05T06:15:00+00:00
