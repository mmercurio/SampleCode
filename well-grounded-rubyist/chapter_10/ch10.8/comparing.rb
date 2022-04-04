# Mixing in Comparable module to compare objects

class Painting
  include Comparable
  attr_reader :price
  def initialize(price)
    @price = price
  end
  def to_s
    "My price is #{price}"
  end
  def <=>(other_painting)
    self.price <=> other_painting.price
  end
end

pa1 = Painting.new(100)
pa2 = Painting.new(200)
p pa1 > pa2   # false
p pa2 > pa1   # true
p pa1 == pa2  # false
pa3 = Painting.new(300)
p pa2.between?(pa1, pa3) # true

cheapest, priciest = [pa1, pa2, pa3].minmax
puts "Cheapest: #{cheapest}" # Cheapest: My price is 100
puts "Priciest: #{priciest}" # Priciest: My price is 300
p Painting.new(1000).clamp(cheapest, priciest).object_id == priciest.object_id # true

# If the Painting's price is less than the first argument, `camp` returns the first argument.
# If the Painting's prcee is greater than the second argument, `camp` returns the second argument.
# If the Painting's price falls between the two arguments, it returns the painting object itself.
p Painting.new(150).clamp(cheapest, priciest) # #<Painting:0x00007ff2888cc0a8 @price=150>
