#!/usr/bin/env ruby

ticket = Object.new

def ticket.date
  '1903-01-02'
end

def ticket.venue
  'Town Hall'
end

def ticket.event
  "Author's Reading"
end

def ticket.performer
  'Mark Twain'
end

def ticket.seat
  'Second Balcony, row J, seat 12'
end

def ticket.price
  5.50
end

def ticket.available?
  false
end

# Let's try something more fancy
def ticket.to_s
  "This ticket is for: #{event}, at #{venue}, on " +
    "#{date}. The performer is #{performer}.\n" +
    "The seat is #{seat}, and it costs $#{'%.2f.' % price}"
end

puts ticket

if ticket.available?
  puts "You're in luck!"
else
  puts "Sorry-- that seat has been sold."
end
