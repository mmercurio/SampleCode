# chaining methods is easy and convenient but
# comes at a price -- creating intermediate objects.
# example:

animals = %w(Jaguar Turtle Lion Antelope)
p animals # ["Jaguar", "Turtle", "Lion", "Antelope"]
puts animals.select {|n| n[0] < 'M' }.map(&:upcase).join(".")
# JAGUAR.LION.ANTELOPE

# enumerators can be used to chain without creating intermediate objects

# enumerables with_index
p ('a'..'z').map.with_index {|letter,i| [letter, i] }
# [["a", 0], ["b", 1], ["c", 2], ["d", 3], ["e", 4], ["f", 5], ["g", 6],
# ["h", 7], ["i", 8], ["j", 9], ["k", 10], ["l", 11], ["m", 12], ["n", 13],
# ["o", 14], ["p", 15], ["q", 16], ["r", 17], ["s", 18], ["t", 19], ["u", 20],
# ["v", 21], ["w", 22], ["x", 23], ["y", 24], ["z", 25]]

module Music
  class Scale
    NOTES = %w(c c# d d# e f f# g a a# b)
    def play
      NOTES.to_enum
    end
  end
end

# using an enum with a block prevents the creationg of intermediate
# collection objects

scale = Music::Scale.new
scale.play.map { |note| puts "next node: #{note}" }
# next node: c
# next node: d
# next node: d#
# next node: e
# next node: f
# next node: f#
# next node: g
# next node: a
# next node: a#
# next node: b

# this also works
scale.play.with_index(1) {|note,i| puts "Note #{i}: #{note}" }
# Note 1: c
# Note 2: c#
# Note 3: d
# Note 4: d#
# Note 5: e
# Note 6: f
# Note 7: f#
# Note 8: g
# Note 9: a
# Note 10: a#
# Note 11: b

