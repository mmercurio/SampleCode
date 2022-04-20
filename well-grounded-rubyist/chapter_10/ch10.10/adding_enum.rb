# adding enumerability with an enumerator
# to objects that don't already have it.

module Music
  class Scale
    NOTES = %w(c c# d d# e f f# g a a# b)
    def play
      NOTES.each {|note| yield note }
    end
  end
end

scale = Music::Scale.new
scale.play {|note| puts "Next note is #{note}" }
# Next note is c
# Next note is c#
# Next note is d
# Next note is d#
# Next note is e
# Next note is f
# Next note is f#
# Next note is g
# Next note is a
# Next note is a#
# Next note is b

# But this won't work because Scale doesn't mixin Enumerable
# scale.map { |note| note.upcase }
# undefined method `map' for #<Music::Scale:0x00007fb737068420> (NoMethodError)

# Creating an enumerator:
p enum = scale.enum_for(:play)
# #<Enumerator: #<Music::Scale:0x00007f9157060370>:play>
p enum.map {|note| note.upcase }
# ["C", "C#", "D", "D#", "E", "F", "F#", "G", "A", "A#", "B"]
p enum.select {|note| note.include?('f') }
# ["f", "f#"]

