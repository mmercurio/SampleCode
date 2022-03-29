# Enumerble Boolean queries

states = [
  "California",
  "Connecticut",
  "Delaware",
  "Lousiana",
  "New Hampshire",
  "New Jersey",
  "New York",
  "Virgina",
  "West Virgina"
]
puts "states: #{states}"

# state names with spaces
spaces = states.select { |s| s =~ / / }
puts "states with spaces: #{spaces}"

# state names without spaces
no_spaces = states.select { |s| not s =~ / / }
puts "states without spaces: #{no_spaces}"

print "Does the array include Lousiana? "
p states.include?("Lousiana")          # true

print "Do all states include a space? "
p states.all? {|state| state =~ / / }  # false

print "Do all states with spaces include a space? "
p spaces.all? {|item| item =~ / / }    # true

print "Does any state include a space? "
p states.any? { |state| state =~ / / } # true

print "Does any state without spaces include a space? "
p no_spaces.any? { |state| state =~ / / } # false

print "Is there one, and only one, state with 'West' in its name? "
p states.one? { |state| state =~ /West/ } # true

print "Is there no states with 'East' in their names? "
p states.none? { |state| state =~ /East/ } # false

state_hash = {
  "California" => "CA",
  "Connecticut" => "CT",
  "Delaware" => "DE",
  "Lousiana" => "LA",
  "New Hampshire" => "NH",
  "New Jersey" => "NJ",
  "New York" => "NY",
  "Virgina" => "VA",
  "West Virgina" => "WV"
}

# state names with spaces
spaces = state_hash.select { |state,abbr| state =~ / / }
puts "states with spaces: #{spaces}"

# state names without spaces
no_spaces = state_hash.select { |state,abbr| not state =~ / / }
puts "states without spaces: #{no_spaces}"

# states with abbrebiations that end in 'A'
end_in_a = state_hash.select { |state,abbr| abbr =~ /.A/ }
puts "states with abbrebiations ending in 'A': #{end_in_a}"

print "Does the hash include Lousiana? "
p state_hash.include?("Lousiana")    # true

print "Do all states include a space? "
p state_hash.all? { |state, abbr| state =~ / / }  # false

print "Is there one, and only one, state with 'West' in its name? "
p state_hash.one? { |state, abbr| state =~ /West/ } # true

print "Are there no states with 'East' in their names? "  # true
p state_hash.none? { |state, abbr| state =~ /East/ } # false

# Looking at values instead of keys:

print "Do all states have abbreviations with exactly two letters? " # true
p state_hash.all? { |state, abbr| abbr.length == 2 }  # true

print "Do all states have abbreviations ending in 'A'? " # false
p state_hash.all? { |state, abbr| abbr =~ /.A/ }

print "Do all states with abbreviations ending in 'A' end in 'A'? " # true
p end_in_a.all? { |state, abbr| abbr =~ /.A/ }

# converting keys to arrays:
print "Do all states include a space? " # false
p state_hash.keys.all? {|state| state =~ / / }

# converting values to arrays:
print "Do all states have abbreviations ending in 'A'? " # false
p state_hash.values.all? {|abbr| abbr =~ /.A/ }

# with Ranges (note only works with ranges of discrete values like integers and letters):

p r = Range.new(1, 10)
print "Does the range contain one 5? " # true
p r.one? { |n| n == 5 }

print "Does the range contain no even numbers? " # false
p r.none? { |n| n % 2 == 0 }

r = Range.new(1.0, 10.0) # range of floats
# r.one? { |n| n == 5 }  DOES NOT WORK - TypeError
# enumerable_queries.rb:110:in `each': can't iterate from Float (TypeError)

p r = Range.new(1, 10.3)
print "Does range contain any greater than 5? "
p r.any? {|n| n > 5 }
