# Sorting enumerables

ints = [3,2,5,4,1]
puts "Sorting array of ints: "
p ints.sort # [1, 2, 3, 4, 5]

# to sort an aribtrary object, need to define <=> operator. Example:

class Painting
  attr_reader :price
  def initialize(price)
    @price = price
  end
  def to_s
    "My price is #{price}."
  end
  def <=>(other_painting)
    self.price <=> other_painting.price
  end
end

# geneate some painings with random prices
paintings = 5.times.map { Painting.new(rand(100..900)) }
puts "5 randomly generated painting prices:"
puts paintings
# My price is 593.
# My price is 165.
# My price is 422.
# My price is 176.
# My price is 107.

puts "Same paintings, sored:"
puts paintings.sort
# My price is 107.
# My price is 165.
# My price is 176.
# My price is 422.
# My price is 593.


# supply a code block to use during sort compare
class Painting
  attr_reader :price, :year
  def initialize(price, year)
    @price = price
    @year = year
  end
  def to_s
    "Price is #{price}; year is #{year}."
  end
end

# geneate some painings with random prices and years
paintings = 5.times.map { Painting.new(rand(100..900), rand(1500..1900)) }
puts "5 randomly generated paintings:"
puts paintings
# Price is 704; year is 1846.
# Price is 562; year is 1719.
# Price is 439; year is 1538.
# Price is 560; year is 1833.
# Price is 230; year is 1677.

puts "sorted by year:"
year_sort = paintings.sort do |a,b|
  a.year <=> b.year
end
puts year_sort
# Price is 439; year is 1538.
# Price is 230; year is 1677.
# Price is 562; year is 1719.
# Price is 560; year is 1833.
# Price is 704; year is 1846.

# `sort` with code block can be used to sort objects
# that don't have an <=> operator or even for two objects
# of different classes.

array = ["2", 1, 5, "3", 4, "6"]
p array
sorted = array.sort {|a,b| a.to_i <=> b.to_i}
puts "sorted: #{sorted}" # [1, "2", "3", 4, 5, "6"]

# `sort_by` takes a block used to sort elements
array = ["2", 1, 5, "3", 4, "6"]
p array
sorted2 = array.sort_by {|a| a.to_i }
puts "sorted using sort_by: #{sorted2}" # [1, "2", "3", 4, 5, "6"]
puts "same as previous sort: #{sorted == sorted2}" # true

# The above call to `sort_by` can be shortened
# using this syntax instead of passing the block direclty
sorted3 = array.sort_by(&:to_i)
puts "sorted again: #{sorted3}" # [1, "2", "3", 4, 5, "6"]
puts "same as previous sorts: #{sorted3 == sorted}" # true
