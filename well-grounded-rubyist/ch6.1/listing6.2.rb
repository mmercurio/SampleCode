# Listing 6.2. Implementing `case` statement behavior for the Ticket class

class Ticket
  attr_accessor :venue, :date
  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def ===(other_ticket)
    self.venue === other_ticket.venue
  end
end

ticket1 = Ticket.new("Town Hall", "07/08/18")
ticket2 = Ticket.new("Conference Center", "07/08/18")
ticket3 = Ticket.new("Town Hall", "08/09/18")
puts "ticket1 is for an event at #{ticket1.venue}."
case ticket1
when ticket2
  puts "Same location as ticket2!"
when ticket3
  puts "Same location as ticket3!"
else
  puts "No match."
end

# using `case` without an expression: the first when clause that is true, will be selected.
case
when ticket1.venue == "Town Hall"
  puts "ticket1 is for the Town Hall"
when ticket3.venue == "Conference Center"
  puts "ticket1 isn't at the Town Hall but ticket3 is"
when ticket2.venue == "Conference Center"
  puts "Neither tickets 1 or 2 were at the Town Hall. Ticket 3 is for the Conference Center"
else
  puts "Neither tickets 1 or 2 were at teh Town Hall and Ticket 3 is not at the Conference Center."
end
