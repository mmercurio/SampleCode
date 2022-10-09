# 12.2.6 writing files
f = File.new("data.out", "w") # open file for writing
f.puts "David A. Black, Rubyist" # nil
f.close
puts File.read("data.out") # David A. Black, Rubyist

f = File.new("data.out", "a") # open file for appending
f.puts "Joe Leo III, Rubyist"
f.close
puts File.read("data.out")
# David A. Black, Rubyist
# Joe Leo III, Rubyist

