# Listing 6.5. Inspecting variable behavior within the block

class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  def Temperature.now
    rand(0..100)
  end
end

celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
fahrenheit  = Temperature.now
puts "The temperature is now: #{fahrenheit} degrees Fahrenheit."
puts "Celsius\tFahrenheit"
celsius.each do |c|
  fahrenheit = Temperature.c2f(c)
  puts "#{c}\t#{fahrenheit}"
end
puts fahrenheit

# the value fahrenheit is reassigned each time in the block and its final value (outside the block)
# is its value the last time it was modified within the block.

# In order to perserve fahrenheit, use a block-local variable as a temporary variable that exists
# only within the block and is seprate from any variable outside the block with the same name.
fahrenheit  = Temperature.now
puts "The temperature is now: #{fahrenheit} degrees Fahrenheit."
puts "Celsius\tFahrenheit"
celsius.each do |c;fahrenheit|
  # fahrenehit is block-local which doesn't affect variable with same name
  fahrenheit = Temperature.c2f(c)
  puts "#{c}\t#{fahrenheit}"
end
puts "fahrenheit is still  #{fahrenheit}"
