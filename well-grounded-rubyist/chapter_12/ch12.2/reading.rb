f = File.new("code/ticket2.rb")
p f  # #<File:code/ticket2.rb>
p f.read
# "# Listing 3.2 Ticket\n\nclass Ticket\n  ...
f.close

# gets to read one line
f = File.new("code/ticket2.rb")
p f.gets # "# Listing 3.2 Ticket\n"
