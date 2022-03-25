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

def ticket.print_details(*x)
  x.each { |detail| puts "This ticket is #{detail}" }
end

puts ticket

# this ticket is non-refundable
# this ticket is non-transferable
# this ticket is in a non-smoking section
ticket.print_details("non-refundable", "non-transferable", "in a non-smoking section")
