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
  def discount(percent)
    if @price != nil
      @price -= (@price * percent/100.0)
    end
    formatted_price
  end
  def formatted_price
    if @price == nil
      "N/A"
    else
      "$#{"%.2f" % @price}"
    end
  end
end

ticket =  Ticket.new("Town Hall", "2013-11-12")
ticket.price=(100)
puts "The ticket costs #{ticket.formatted_price}."
puts "The ticket for #{ticket.venue} has been discounted 15% to #{ticket.discount(15)}"
