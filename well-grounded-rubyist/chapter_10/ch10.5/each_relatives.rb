# Relatives of each

# `reverse_each` iterates backwards through enumerable
[1,2,3].reverse_each {|e| puts e * 10}
# 30
# 20
# 10

# Obviously do NOT use `reverse_each` on infinite iteration!

# `each_with_index` and `each.with_index`
# yields element and its index
names = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison"]
p names
names.each_with_index do |pres, i|
  puts "#{i+1}. #{pres}"
end
# 1. George Washington
# 2. John Adams
# 3. Thomas Jefferson
# 4. James Madison

# What if the enumerable object doesn't know its index?
# Arrays have an index:
%w(a b c).each_index {|i| puts i}
# 0
# 1
# 2

# Hashs... mayby not?
letters = {"a" => "ay", "b" => "bee", "c" => "see"}
p letters

# `each_index` won't work on hash because it doesn't have an index:
#letters.each_index {|(key,value),i| puts i}
# `<main>': undefined method `each_index' for {"a"=>"ay", "b"=>"bee", "c"=>"see"}:Hash (NoMethodError)

puts "'each_with_index on letters:"
letters.each_with_index {|(key,value),i| puts i}
# works because the resul is simply enumerated and asigned an index.
# 0
# 1
# 2

# using `each.with_index` is better than `each_with_index`:
array = %w(red yellow blue)
array.each.with_index do |color,i|
  puts "Color number #{i} is #{color}"
end
# Color number 0 is red
# Color number 1 is yellow
# Color number 2 is blue

# `each_slice` and `each_cons` to talk through a collection a number of elements at a time,
# yielding an array of that many elements to the block on each iteration.
# `each_slice` handles each element only once; `each_cons` takes a new grouping at each element.

array =*(1..10)
p array
# Here, `each_slice` moves through the array by 3 each time, taking 3 element in each iteration.
puts "each_slice(3) produces"
array.each_slice(3) {|slice| p slice}
# [1, 2, 3]
# [4, 5, 6]
# [7, 8, 9]
# [10]

# Here, `each_cons`` moves through the array by one and takes 3 element in each iteration
puts "each_cons(3) produces"
array.each_cons(3) {|cons| p cons}
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]
# [4, 5, 6]
# [5, 6, 7]
# [6, 7, 8]
# [7, 8, 9]
# [8, 9, 10]

p parsed_report = ["Top Secret Report", "Eyes Only", "=====", "Title: The Meaning of Life"]
puts "slice_before(/=/):"
p parsed_report.slice_before(/=/).to_a
# [["Top Secret Report", "Eyes Only"], ["=====", "Title: The Meaning of Life"]]

puts "slice_after(/=/):"
p parsed_report.slice_after(/=/).to_a
# [["Top Secret Report", "Eyes Only", "====="], ["Title: The Meaning of Life"]]

p parsed_report = ["Top Secret Report", "Eyes Only", "=====", "Title: The Meaning of Life",
  "Author: [REDACTED", "Date: 2018-01-01", "=====", "Abstract:\n"]
puts "Now slice_after(/=/) produces multiple groups:"
p parsed_report.slice_after(/=/).to_a
# [["Top Secret Report", "Eyes Only", "====="], ["Title: The Meaning of Life", "Author: [REDACTED", "Date: 2018-01-01", "====="], ["Abstract:\n"]]

print "slice integers 1..10 before each even: "
p (1..10).slice_before {|num| num % 2 == 0}.to_a # [[1], [2, 3], [4, 5], [6, 7], [8, 9], [10]]

puts "Using slice_before with File 'report.dat':"
array = File.open('report.dat').slice_before do |line|
  line.start_with?("=")
end.to_a
p array
# [["Top Secret Report\n", "Eyes Only\n"], ["=====\n", "Title: The Meaning of Life\n", "Author: [REDACTED]\n", "Date: 2018-01-01\n"], ["=====\n", "Abstract:\n", "In this report I give you the meaning of life, pain and simple.\n"]]

# `cycle` yields all elements in the object in a loop, with an optional argument specifying the
# number of times. The default is to loop forever. `cycle` can be used to determine how many
# times to iterate through a collection.

class PlayingCard
  SUITS = %w(clubs diamonds hearts spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  class Deck
    attr_reader :cards
    def initialize(n=1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

double_deck = PlayingCard::Deck.new(2)
print "A double deck of cards: "
puts double_deck.cards.size # 104

single_deck = PlayingCard::Deck.new
print "A single deck of cards: "
puts single_deck.cards.size # 52

# `inject` / `reduce` (similar to 'fold' in other functional languages)
# initializes an accumulator object and iterates through a collection performing
# calculations on each iteration and resetting the accumulator to the result of the calculation.

array = [1,2,3,4]
p array
puts "Add each to sum of previous: "
p array.inject(0) { |acc,n| puts ">> acc=#{acc} n=#{n}"; acc + n}
# >> acc=0 n=1
# >> acc=1 n=2
# >> acc=3 n=3
# >> acc=6 n=4
# 10

# The `inject` expression above can be simplied with `inject(:+)`.
# `:+` tells Ruby to use 0-based accumulator and obciates the need
# to explicitly pass 0.

p array.inject(:+) # 10

puts "Adding again, automatically initialized to 1 instead of explictly using 0: "
result = array.inject do |acc,n|
  puts "adding #{acc} and #{n}... #{acc+n}"
  acc + n
end
# adding 1 and 2... 3
# adding 3 and 3... 6
# adding 6 and 4... 10
p result # 10
