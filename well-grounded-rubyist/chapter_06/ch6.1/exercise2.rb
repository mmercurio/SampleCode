# Exercise 2: Create class TicketComparer that has a class method `compare` that
# encapusualtes the case statement. To make the tickets easier to identify, add
# a :name attrivute to teh Ticket class.
#
# TicketComparer.compare(ticket1, ticket2, ticket3)
#
# will produce the output as:
# ticket1 is for an event on: 07/08/18
# Same date as ticket2!

class Ticket
  attr_reader :name
  attr_accessor :venue, :date
  def initialize(name, venue, date)
    @name = name
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

class TicketComparer
  def TicketComparer.compare(ticket1, ticket2, ticket3)
    puts "#{ticket1.name} is for an event at #{ticket1.venue} on #{ticket1.date}."
    case ticket1
    when ticket2
      puts "Same #{Ticket.matches_on} as #{ticket2.name}!"
    when ticket3
      puts "Same #{Ticket.matches_on} as #{ticket3.name}!"
    else
      puts "No match."
    end
  end
end


ticket1 = Ticket.new("ticket1", "Town Hall", "07/08/18")
ticket2 = Ticket.new("ticket2", "Conference Center", "07/08/18")
ticket3 = Ticket.new("ticket3", "Town Hall", "08/09/18")

TicketComparer.compare(ticket1, ticket2, ticket3)

# try again in a differnt order -- should be the same result
TicketComparer.compare(ticket1, ticket3, ticket2)
