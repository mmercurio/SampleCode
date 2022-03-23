# Listing 6.4. Yield at work in Integer#my_times

class Integer
  def my_times
    c = 0
    puts "c = 0"
    puts "until c == #{self}..."
    until c == self
      yield c
      c += 1
    end
    self
  end
end

5.my_times {|i| puts "I'm on interation #{i}!" }
