# CODING EXERCISE 1
#
# Assume you have a list of access logs, where each log entry look like this:
#
# ```
# 127.0.0.1 06-08-2020T15:00:00+00:00 GET /cat.gif HTTP/1.0 200 32768
# 127.0.0.1 06-08-2020T15:01:00+00:00 GET /top.htm HTTP/1.0 200 8192
# 127.0.0.1 06-08-2020T15:02:00+00:00 GET /wow.jpg HTTP/1.0 404 2326
# 127.0.0.1 06-08-2020T15:03:00+00:00 GET /cat.gif HTTP/1.0 200 32768
# ```
#
# Write a program to process this list, and print the total count of each response code.
# For example, if the file contained only the above four lines, the output could be
# something like this:
#
# 200: 3
# 404: 1

input = '127.0.0.1 06-08-2020T15:00:00+00:00 GET /cat.gif HTTP/1.0 200 32768
127.0.0.1 06-08-2020T15:01:00+00:00 GET /top.htm HTTP/1.0 200 8192
127.0.0.1 06-08-2020T15:02:00+00:00 GET /wow.jpg HTTP/1.0 404 2326
127.0.0.1 06-08-2020T15:03:00+00:00 GET /cat.gif HTTP/1.0 200 32768'
status_codes = {}
# alternatively: lines = File.open('log').readlines
input.split(/\n/) do |line|
    status = line.split(' ')[5].to_i
    if not status_codes.has_key?(status)
        status_codes[status] = 0
    end
    status_codes[status] += 1
end

status_codes.each { |status,count| puts "#{status}: #{count}" }
