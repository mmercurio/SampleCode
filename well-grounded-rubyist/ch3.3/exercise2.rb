require 'date'

class Ticket
  def initialize(venue)
    puts "Creating a new ticket!"
    @venue = venue
  end
  def venue
    @venue
  end
  def date
    @date
  end
  def date=(date)
    begin
      if not date.match?(/^\d\d\d\d-\d\d-\d\d$/)
        raise "invalid date"
      end
      @date = Date.parse(date).strftime("%Y-%m-%d")
    rescue
      puts "Please submit date in yyyy-mm-dd format (e.g. '#{Date.today.strftime("%Y-%m-%d")}')."
    end
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
  def formatted_price
    if @price == nil
      "N/A"
    else
      "$#{"%.2f" % @price}"
    end
  end
  def discount(percent)
    if @price != nil
      @price -= (@price * percent/100.0)
    end
    formatted_price
  end

end

ticket =  Ticket.new("Town Hall")
ticket.date = "2013-11-13"
ticket.date = "13-11-13"
