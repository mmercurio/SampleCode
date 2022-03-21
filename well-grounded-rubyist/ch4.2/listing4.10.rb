# Listing 4.10. Using `super` to wrap a method in a subclass
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end
end
class Tandem < Bicycle
  def initialize(gears)
    super # note: gears is also passed to super's initialize
    @seats = 2
  end
end

bike = Bicycle.new
p bike

tandem = Tandem.new(2)
p tandem
