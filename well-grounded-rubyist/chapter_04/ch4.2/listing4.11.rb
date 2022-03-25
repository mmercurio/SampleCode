# Listing 4.11. Additional methods to illustrate `mothed` and `super_method`
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
  def rent
    puts "Sorry but this model is sold out."
  end
end
class Tandem < Bicycle
  def initialize(gears)
    super # note: gears is also passed to super's initialize
    @seats = 2
  end
  def rent
    puts "This bike is available!"
  end
end

bike = Bicycle.new
p bike
puts "Rent a bicycle?"
bike.rent

t = Tandem.new(2)
p t
puts "Rent a tandem bicycle?"
t.rent

p t.method(:rent) # Tandem#rent
p t.method(:rent).super_method # Bicycle#rent

puts "calling Tandem#rent..."
t.method(:rent).call

puts "calling Bicycle#rent..."
t.method(:rent).super_method.call

puts "What happens if no super method exists in the hierachy?"
p t.method(:rent).super_method.super_method
