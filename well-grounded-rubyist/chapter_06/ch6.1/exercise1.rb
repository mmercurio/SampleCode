# Exercise 1: modify Listing 6.2 to match on date instead of venue

class Ticket
  attr_accessor :venue, :date
  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def Ticket.matches_on
    :date  # can be either :date or :venue
  end

  def ===(other_ticket)
    self.send(Ticket.matches_on) === other_ticket.send(Ticket.matches_on)
  end

end

ticket1 = Ticket.new("Town Hall", "07/08/18")
ticket2 = Ticket.new("Conference Center", "07/08/18")
ticket3 = Ticket.new("Town Hall", "08/09/18")
puts "ticket1 is for an event at #{ticket1.venue} on #{ticket1.date}."
case ticket1
when ticket2
  puts "Same #{Ticket.matches_on} as ticket2!"
when ticket3
  puts "Same #{Ticket.matches_on} as ticket3!"
else
  puts "No match."
end
