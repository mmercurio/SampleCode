# Creating enumerators with a code block
e = Enumerator.new do |y|
  y << 1
  y << 2
  y << 3
end

# What is y? A "yielder": Enumerator::Yielder:
# https://ruby-doc.org/core-2.7.0/Enumerator/Yielder.html

# In the above example, each time the enumerator `each` is called, the value yielded
# is 1, then 2, then 3.
e.each { |value| p value }
# 1
# 2
# 3

# other uses of enumerator, e:
p e.to_a  # [1, 2, 3]
p e.map {|x| x * 10 } # [10, 20, 30]
p e.select {|x| x > 1} # [2, 3]
p e.take(2) # [1, 2]

# rewriting Enumerator e using a loop
e = Enumerator.new do |y|
  (1..3).each { |i| y << i }
end

p e.to_a # [1, 2, 3]

# What happens when the enumerator is created?
e = Enumerator.new do |y|
  puts "Starting up the block!"
  (1..3).each {|i| y << i }
  puts "Exiting the block!"
end

p e.to_a
# Starting up the block!
# Exiting the block!
# [1, 2, 3]

p e.select { |x| x > 2}
# Starting up the block!
# Exiting the block!
# [3]

# The block is executed once for each iterator called on e.

# Example in which the enumerator performs a calculation involving elements of an array
# while removing those elements from the array permanently:
a = [1,2,3,4,5]
e = Enumerator.new do |y|
  total = 0
  until a.empty?
    total += a.pop
    y << total
  end
end

p a             # [1, 2, 3, 4, 5]
p e.take(2)     # [5, 9]
p a             # [1, 2, 3]
p e.to_a        # [3, 5, 6]
p a             # []
