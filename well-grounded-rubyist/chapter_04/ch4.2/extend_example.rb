# extend example - 'extend' make a module's methods available as class methods.
class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  def Temperature.f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

module Convertible
  def c2f(celsius)
    celsius * 9.0 / 5 + 32
  end
  def f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

class Thermometer
  extend Convertible
end

puts Thermometer.c2f(100)
puts Thermometer.f2c(212)
p Thermometer.ancestors
