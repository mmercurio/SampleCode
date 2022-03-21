class Ticket
  def initialize(venue, date)
    puts "Creating a new ticket!"
    @venue = venue
    @date = date
  end
  def venue
    @venue
  end
  def date
    @date
  end
end

tickets = [
  Ticket.new("Town Hall", "2013-11-12"),
  Ticket.new("Convention Center", "2014-12-13")
]
puts "We've created #{tickets.count} tickets."
tickets.each_index do |i|
  puts "Ticket ##{i+1} is for #{tickets[i].venue} event on #{tickets[i].date}."
end
