l = [1,2,3,4]
print "return first element of #{l}: "
p l.first # 1

h = {1 => 2, "one two " => "three"}
print "return first element of #{h}: "
p h.first # [1, 2

# Note that in the above hash example, the result is an array.
# This is because hash enumerables yield kay/value pairs as arrays.

# Also note, that for enumerable iterations it's not always possible
# to locate the "last" item and for some never-ending iterations
# there is no such last item. Enumerable#last does not exist!

# Example of an object with an iteration that never ends:

class Die
  include Enumerable
  def each
    loop do
      yield rand(6) + 1
    end
  end
end

# Each iteration yeilds a new random number between 1 and 6. However, the sequence
# never ends and will go on forever as many times as the iteration is used.

puts "Welcome to 'You Win If You Roll a 6'!"
d = Die.new
turns = 0
d.each do |roll|
  turns += 1
  puts "You rolled a #{roll}"
  if roll == 6
    puts "You win in #{turns} turns!"
    break
  end
end

# running the above multiple times produces different results:
#   You win in 24 turns!
#   You win in 5 turns!
#   You win in 2 turns!
#   You win in 6 turns!
# ..etc.

# Some Enumerable class do implement `last` (examples include `Array` and `Range`)
# but this is not part of the `Enumerable` module.`

# `take` select elements from the beginning
# `drop` drop elements from the end and return remaining
states = %w(NY NJ CT MA VT FL)
p states
puts "Grab first two states with `take`: "
p states.take(2) # ["NY", "NJ"]
puts "Grab all but the last two states with `drop`: "
p states.drop(2) # ["CT", "MA", "VT", "FL"]

# `take_while` uses `take` with a block to specify which elemnts are taken:
print "States containing 'N': "
p states.take_while {|s| /N/.match(s)} # ["NY", "NJ"]

# `drop_while` uses `drop` with a block to specify which elements are dropped:
print "States not containing 'N': "
p states.drop_while {|s| /N/.match(s)} # ["CT", "MA", "VT", "FL"]

# `min` and `max`
l = [1,2,3,5,4,2]
print "max of #{l}: "
p l.max # 5

l = %w(Ruby C APL Perl Smalltalk)
print "min of #{l}: "
p l.min # "APL"

# can also supply an optional clode block to `min` and `max` to define criteria used in comparison:

print "min of #{l} using name size: "
p l.min {|a,b| a.size <=> b.size } # "C"

# use `min_by` and `max_by` to perform comparison explicitly:

print "min_by of #{l} using name size: "
p l.min_by {|l| l.size}  # "C"
print "max_by of #{l} using name size: "
p l.max_by {|l| l.size}  # "Smalltalk"

# `minmax` and `minmax_by` result in a pair of values [min,max]
print "min and max of #{l}: "
p l.minmax  # ["APL", "Smalltalk"]

print "min and max using minmax_by of #{l}: "
p l.minmax_by {|l| l.size}  # ["C", "Smalltalk"]

# WARNING: for some enumerable iterations min/max operations may not make sense.
# For example, the Die class above using `min` or `max` would cause the program to hang
# because the iteration never ends!

# for hashes, `min` and `max` use keys for ordering

state_hash = {"New York" => "NY", "Maine" => "ME", "Alaska" => "AK", "Alabama" => "AL"}
p state_hash
print "min: "
p state_hash.min # ["Alabama", "AL"]

print "min_by using state names: "
p state_hash.min_by {|name, abbr| name }  # ["Alabama", "AL"]

print "min_by using state abbrebiation: "
p state_hash.min_by {|name, abbr| abbr }  # ["Alaska", "AK"]
