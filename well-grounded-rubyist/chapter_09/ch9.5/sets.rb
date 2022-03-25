# Set is not part of Ruby core. It's a standard library
# class, meaning this is needed to use it:

require 'set'

# creating sets. There is no set literal like other collections
# such as arrays, hashes, and lists.
#
# Set.new to create sets

# Creating set from an array using Set.new
new_england = [ "Connecticut", "Maine", "Massachusetts",
                "New Hampshire", "Rhode Island", "Vermont" ]
state_set = Set.new(new_england)
p state_set
# #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>

# Set.new with code block
names = ["David", "Yukihiro", "Chad", "Amy"]
name_set = Set.new(names) { |name| name.upcase }
p name_set          # # <Set: {"DAVID", "YUKIHIRO", "CHAD", "AMY"}>

# Managing set elements

# << to add element
tri_state = Set.new(["New Jersey", "New York"])
tri_state << "Connecticut"
p tri_state        # # <Set: {"New Jersey", "New York", "Connecticut"}>

# delete to remove element
tri_state.delete("Connecticut")
p tri_state        # # <Set: {"New Jersey", "New York"}>

# add is same as <<
# add? is like add which returns the set if the element
# is already in the set  or nil if not already in the set.
p tri_state.add?("Pennsylvania")    # nil

# set operations:
#   interaction, aliased to &
#   union, aliased to + and |
#   difference, aliased to -
# each returns a new set.
#
# difference, -
p state_set # #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>
tri_state = Set.new(["Connecticut", "New Jersey", "New York"])
p state_set - tri_state # #<Set: {"Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>

# Union, +, |

p state_set + tri_state
p state_set | tri_state
# #<Set: {"Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "New Jersey", "New York"}>

# Intersection, &
p state_set & tri_state           # #<Set: {"Connecticut"}>

# exclusive or, ^
p state_set ^ tri_state
# #<Set: {"New Jersey", "New York", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"}>

p state_set ^ state_set     # #<Set: {}>

# merging collections

# merging array
tri_state = Set.new(["Connecticut", "New Jersey"])
tri_state.merge(["New York"])
p tri_state                 # #<Set: {"Connecticut", "New Jersey", "New York"}>

# merging hash
s = Set.new([1,2,3])
s.merge({ "New Jersey" => "NJ", "Maine" => "ME" })
p s  # #<Set: {1, 2, 3, ["New Jersey", "NJ"], ["Maine", "ME"]}>

# merging keys from hash
state_set = Set.new(["New York", "New Jersey"])
state_hash = { "Maine" => "ME", "Vermont" => "VT" }
p state_set.merge(state_hash.keys) # #<Set: {"New York", "New Jersey", "Maine", "Vermont"}>

# Testing for subsets? and supersets?

small_states = Set.new(["Connecticut", "Deleware", "Rhode Island"])
tiny_states = small_states = Set.new(["Deleware", "Rhode Island"])

p tiny_states.subset?(small_states)     # true
p small_states.superset?(tiny_states)   # true


