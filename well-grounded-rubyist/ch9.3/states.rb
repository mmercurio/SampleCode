state_hash = {
  "California" => "CA",
  "Connecticut" => "CT",
  "Delaware" => "DE",
  "New Hampshire" => "NH",
  "New Jersey" => "NJ",
  "New York" => "NY",
  "Virgina" => "VA"
}

puts "States:"
state_hash.keys.each { |state| puts "  #{state}" }

print "Enter the same of a state: "
state = gets.chomp
abbr = state_hash[state]
puts "The abbreviation for #{state} is #{abbr}."
