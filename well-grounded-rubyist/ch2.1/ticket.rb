#!/usr/bin/env ruby

ticket = Object.new

def ticket.date
    "1903-01-02"
end

def ticket.venue
    "Town Hall"
end

def ticket.event
    "Author's Reading"
end

def ticket.performer
    "Mark Twain"
end

def ticket.seat
    "Second Balcony, row J, seat 12"
end

def ticket.price
    5.50
end

# original
# print "This ticket is for: "
# print ticket.event + ", at "
# print ticket.venue + ", on "
# print ticket.date + "."
# print "The performer is "
# puts ticket.performer + "."
# print "The seat is "
# print ticket.seat + ", "
# print "and it costs $"
# puts "%.2f." % ticket.price

# Let's try something more fancy
def ticket.to_s
    "This ticket is for: #{event}, at #{venue}, on " +
    "#{date}. The performer is #{performer}.\n" +
    "The seat is #{seat}, and it costs $#{"%.2f." % price}"
end

puts ticket
