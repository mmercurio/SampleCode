# Listing 6.3. Using for/in with the Temperature class

class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
end

celsius = [0, 10, 20, 30, 40, 50, 60, 80, 80, 90, 100]
puts "Celsius\tFahrenehiet"
for c in celsius
  puts "#{c}\t#{Temperature.c2f(c)}"
end
