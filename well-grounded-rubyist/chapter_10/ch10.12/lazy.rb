# Lazy enumerators can be used to enumerate selectively over infinitely larege collections.

# Attempt to compute first 10 mulitples of 3 from an infinite collection:
# (1..Float::INFINITY).select{|n| n % 3 == 0 }.first(10)
#  (that would never return)

# use a lazy enumerator to get a finite result from an infinite collection
lenum = (1..Float::INFINITY).lazy
p lenum #  => #<Enumerator::Lazy: 1..Infinity>
p lenum.select{|n| n % 3 == 0 }.first(10)    # [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

# FizzBuzz with a lazy enumerator

def fb_calc(i)
  case 0
  when i % 15
    "FizzBuzz"
  when i % 3
    "Fizz"
  when i % 5
    "Buzz"
  else
    i.to_s
  end
end

def fb(n)
  (1..Float::INFINITY).lazy.map {|i| fb_calc(i) }.first(n)
end

p fb(15)
# ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
