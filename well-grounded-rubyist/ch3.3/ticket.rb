class Ticket
  def initialize(venue, date)
    puts "Creating a new ticket!"
    @venue = venue
    @date = date
    @price = price
  end
  def venue
    @venue
  end
  def date
    @date
  end
  def price=(amount)
    if (amount * 100).to_i == amount * 100
      @price = amount
    else
      puts "The amount seems to be malformed: #{amount}"
    end
  end
  def price
    @price
  end
end

ticket =  Ticket.new("Town Hall", "2013-11-12")
ticket.price=(63.00)
puts "The ticket costs $#{"%.2f" % ticket.price}."
ticket.price = 72.50 # another way of calling ticket.price=(72.50)
puts "Whoops -- it just went up. IT now costs $#{"%.2f" % ticket.price}."

# This doesn't change the price
ticket.price = 72.501
puts "Ticket still costs $#{"%.2f" % ticket.price}."
