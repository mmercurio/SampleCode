# Enumerable searching and selecting

# `find` to retreive first match
a =* (1..10)
p a
print "Find first element greater than 5: "
p a.find { |n| n > 5 }  # 6

print "Find first element greater than 100: "
p a.find { |n| n > 100 }  # nil

# using anonymous function as block
failure = lambda { 11 }
p (over_ten =*(1..6)).find(failure) {|n| n > 10 } # 11

class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end
r = Rainbow.new
p r.to_a

print "Color names six characters long: "
p r.select {|color| color.size == 6 } # ["orange", "yellow", "indigo", "violet"]

print "First three letters of each: "
p r.map {|color| color[0,3]} # ["red", "ora", "yel", "gre", "blu", "ind", "vio"]

print "Remove colors up to the first whose name has less than 5 letters: "
p r.drop_while {|color| color.size < 5 } # ["orange", "yellow", "green", "blue", "indigo", "violet"]

# `find_all` is same as `select`: a new collection is returned containing all the elements
# from the original collection that match the criteria. If no matching elements are found
# an empty collection is returned. The difference between `find` and `find_all` is that
# `find` will return the first element found as a single element.

a = *(1..10)
p a # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print "Find all items greater than 5: "
p a.find_all { |item| item > 5 } # [6, 7, 8, 9, 10]
print "Select items greater than 100: "
p a.select { |item| item > 100 }   # []

# also `select!`
puts "Original array: #{a}"
a.select! { |item| item > 5 }
print "Modify array to only keep items greater than 5: "
p a # [6, 7, 8, 9, 10]

# `reject`` is opposite of `select`
a = *(1..10)
p a
print "Reject elements greater than 5: "
p a.reject { |item| item > 5 } # [1, 2, 3, 4, 5]

print "Modify array to only keep items NOT greater than 5: "
a.reject! { |item| item > 5 } # [1, 2, 3, 4, 5]
p a

# Selecting on threequal match with `grep`
colors = %w(red orange yellow green blue indigo violet)
p colors
print "Colors with 'o': "
p colors.grep(/o/) # ["orange", "yellow", "indigo", "violet"]

# `grep` uses === (freequal) operator which allows some useful
# matching.

misc = [75, "hello", 10...20, "goodbye"]
p misc
print "Elements that are Strings: "
p misc.grep(String) # ["hello", "goodbye"]
print "Elements between 50 and 100: "
p misc.grep(50..100) # [75]

# `enumerable.grep(expression` is functionally equivalent to:
# `enumerable.select {|element| expression === element}

# organizing results with `group_by`:
# `group_by` takes a block and returns a hash. The block is executed
# for object, unique return values are keys in the hash and the hash's
# values are the elements for which the block returned values for.
colors = %w(red orange yellow green blue indigo violet)
p colors
puts "Colors grouped by number of letters in their names: "
p colors.group_by {|color| color.size} # {3=>["red"], 6=>["orange", "yellow", "indigo", "violet"], 5=>["green"], 4=>["blue"]}

# `partition` is simlar to `group_by` but returns two arrays
# based on whether the block returns true for the element.

class Person
  attr_accessor :age
  def initialize(options)
    self.age = options[:age]
  end
  def teenager?
    (13..19) === age
  end
end

# generate people of varying ages

people =  10.step(25,3).map {|i| Person.new(:age => i)}
print "Generating #{people.size} people of the following ages: "
p people.map {|p| p.age }
# [10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0]

puts "Partition people into teens and non-teens: "
teens = people.partition {|person| person.teenager? }
puts "#{teens[0].size} teens; #{teens[1].size} non-teens" # 3 teens; 3 non-teens
print "ages of teens: "
p teens[0].map {|p| p.age } # [13, 16, 19]
print "ages of non-teens: "
p teens[1].map {|p| p.age } # [10, 22, 25]
