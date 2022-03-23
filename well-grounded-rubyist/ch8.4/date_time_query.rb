# Date/time query methods
require 'date'

dt = DateTime.now
puts dt                            # 2022-03-23T16:30:14-04:00
p dt.year                          # 2022
p dt.minute                        # 30
p dt.second                        # 14

t = Time.now
puts t                            # 2022-03-23 16:31:04 -0400
p t.month
p t.sec

d = Date.today
puts d                            # 2022-03-23
p d.day                           # 23

p t.sunday?                       # false
p d.saturday?                     # false
p dt.friday?                      # false
p dt.wednesday?                   # true

# formatting
p t.strftime("%A")                # "Wednesday"
p t.strftime("%m-%d-%Y")          # "03-23-2022"

p t.strftime("Today is %x")                  # "Today is 03/23/22"
p t.strftime("Otherwise known as %d-%b-%y")  # "Otherwise known as 23-Mar-22"
p t.strftime("Or even day %e of %B, %Y.")    # "Or even day 23 of March, 2022."

p Date.today.rfc2822             # "Wed, 23 Mar 2022 00:00:00 +0000"
p DateTime.now.httpdate          # "Wed, 23 Mar 2022 20:40:13 GMT"

# Date/Time conversion methods

# Time: +/- interpretted as seconds operator
p t                             # 2022-03-23 16:41:42.296782 -0400
p t - 20                        # 2022-03-23 16:41:22.296782 -0400
p t + 20                        # 2022-03-23 16:42:02.296782 -0400

# Date and date/time objects interpret +/- as day-wise operators
# and month-wise converstions with << and >>.
puts dt                        # 2022-03-23T16:44:17-04:00
puts dt + 100                  # 2022-07-01T16:44:17-04:00
puts dt >> 3                   # 2022-06-23T16:44:17-04:00
puts dt << 10                  # 2021-05-23T16:44:17-04:00

# `next` and `succ` move ahead one unit.
# Family of `next_unit` and `prev_unit` allow forward and back by days, months, years.

puts d                       # 2022-03-23
puts d.next                  # 2022-03-24
puts d.next_year             # 2023-03-23
puts d.next_month(3)         # 2022-06-23
puts d.prev_day(10)          # 2022-03-13

# iterate over ranges using `upto` and `downto`
puts d                       # 2022-03-23
puts next_week = d + 7       # 2022-03-30
d.upto(next_week) { |date| puts "#{date} is a #{date.strftime("%A")}" }
# 2022-03-23 is a Wednesday
# 2022-03-24 is a Thursday
# 2022-03-25 is a Friday
# 2022-03-26 is a Saturday
# 2022-03-27 is a Sunday
# 2022-03-28 is a Monday
# 2022-03-29 is a Tuesday
# 2022-03-30 is a Wednesday
