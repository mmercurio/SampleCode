# creating arrays

# creating array of size 3
p Array.new(3)                         # [nil, nil, nil]

# array of 3 identical strings
p Array.new(3, "abc")                  # ["abc", "abc", "abc"]

# creating with block of code repeated for each element
p Array.new(3) { |i| 10 * (i + 1) }    # [10, 20, 30]

# literal array constructor: []

p [] # empty array
p [1, 2, "three", 4, []]               # array with integers, string, and an array within

# index into array (0-relative)
p [1, 2, 3][1]  # 2

# %w and %W (words split on whitespace) array constructors
p %w(Joe Leo III)                     # ["Joe", "Leo", "III"]
# whitespace will need to be escaped
p %w(David\ A.\ Black is a Rubyist.)  # ["David A. Black", "is", "a", "Rubyist."]

# %w (lowercase w) is for single quoted strings
# %W (uppercase W) is for double quoted strings
p %W(Joe is #{2018 - 1981} years old.) # ["Joe", "is", "37", "years", "old."]

# %i and %I array constructors where elements are symbols
# like %W, %I allows for string interpolation
p %i(a b c)                           # [:a, :b, :c]
d = "David"
p %I(#{d})                            # [:David]

# try_convert methods for:
#   Array (to_ary)
#   Hash (to_hash)
#   IO (to_io)
#   Regexp (to_regexp)
#   String (to_str)
# If no such converstion type exist, the result is nil.
obj = Object.new
p Array.try_convert(obj)             # nil
def obj.to_ary
  [1, 2, 3]
end
p Array.try_convert(obj)             # [1, 2, 3]

# Inserting, retrieving, and removing elements
a = []
a[0] = "first"
p a                                  # ["first"]

a = [1,2,3,4,5]
p a[2]                               # 3


a = %w(red orange yellow purple gray indigo violet)
p a # ["red", "orange", "yellow", "purple", "gray", "indigo", "violet"]
p a[3,2]                            # ["purple", "gray"]
# replace elments 3 through 2
a[3,2] = "green", "blue"
p a # ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]

a = %w(red orange yellow purple gray indigo violet)
p a[3..5]                           # ["purple", "gray", "indigo"]
a[1..2] = "green", "blue"
p a # ["red", "green", "blue", "purple", "gray", "indigo", "violet"]

# values_at
array = %w(the dog ate the cat)
p array                             # ["the", "dog", "ate", "the", "cat"]
articles = array.values_at(0,3)
p articles                          # ["the", "the"]

# dig method to extract elements from nested array using
arr = [[1], 2, 3, [4, 5]]
p arr[0]                           # [1]
p arr[3][0]                        # 4
p arr.dig(3,0)                     # 4

p [["Joe", %w(loves Lucy,), "his"], "adorable", ["daughter"]].dig(0,1,1)  # "Lucy,"

# unshift to add an object to the beginning of an array
a = [1,2,3,4]
p a.unshift(0)                    # [0, 1, 2, 3, 4]

# push and << to append to end of the array
p a.push(5)                       # [0, 1, 2, 3, 4, 5]
p a << 6                          # [0, 1, 2, 3, 4, 5, 6]

# push can take multiple arguments
p a.push(7,8,9)                   # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# shift removes one element from the beginning of the array
# pop removes one element from the end of the array
p a.shift                         # 0
p a                               # [1, 2, 3, 4, 5, 6, 7, 8, 9]
p a.pop                           # 9
p a                               # [1, 2, 3, 4, 5, 6, 7, 8]

# shift and pop can remove multiple elements
p a = %w{ one two three four five }
                                  # ["one", "two", "three", "fourr", "five"]
p a.pop(2)                        # "four", "five"]
p a                               # ["one", "two", "three"]
p a.shift(2)                      # ["one", "two",
p a                               # ["three"]]

# combining arrays

p [1,2,3].concat([4,5,6])         # [1, 2, 3, 4, 5, 6]

p a = [1,2,3]                     # [1, 2, 3]
p b = a + [4,5,6]                 # [1, 2, 3, 4, 5, 6]
p a                               # [1, 2, 3]

# replace contents with another array
p a = [1,2,3]                    # [1, 2, 3]
p a.replace([4,5,6])             # [4, 5, 6]

# replace vs assignment
p a = [1,2,3]                    # [1, 2, 3]
p b = a                          # [1, 2, 3]
p a.replace([4,5,6])             # [4, 5, 6]
p b                              # [4, 5, 6]

p a = [1,2,3]                    # [1,2,3]
p b = a                          # [1,2,3]
p a.replace([4,5,6])             # [4,5,6]
p b                              # [4,5,6]
p a = [7,8,9]                    # [7,8,9]
p b                              # [4,5,6]

# transformation

# flatten unnesting of inner arrays
# flatten completely or specify number of levels to flatten
p array = [1,2,[3,4,[5],[6,[7,8]]]] # array with 3 levels of nesting
p array.flatten                         # [1, 2, 3, 4, 5, 6, 7, 8]
p array.flatten(1)                      # 1, 2, 3, 4, [5], [6, [7, 8]]]
p array.flatten(2)                      # [1, 2, 3, 4, 5, 6, [7, 8]]
p array.flatten(3)                      # [1, 2, 3, 4, 5, 6, 7, 8]

p array # original unmodified: [1, 2, [3, 4, [5], [6, [7, 8]]]]
array.flatten!  # not any more!
p array                                # [1, 2, 3, 4, 5, 6, 7, 8]

# reverse
a = [1,2,3,4]
p a.reverse                           # [4, 3, 2, 1]
p a   # original unmodified: [1,2,3,4]
a.reverse!
p a                                   # [4, 3, 2, 1]

# join returns a string by joining elements in the array
p ["abc", "def", 123].join           # "abcdef123"
# can also specify what to place between elements joined
p ["abc", "def", 123].join(", ")     # "abc, def, 123"

# joining with * method
p a = %w(one two three)              # ["one", "two", "three"]
p a * "-"                            # "one-two-three"

# uniq returns new array consisting of unique elements from original
a = [1,2,3,1,4,3,5,1]
p a.uniq                             # [1, 2, 3, 4, 5]
p a                                  # [1, 2, 3, 1, 4, 3, 5, 1]
a.uniq!
p a                                  # [1, 2, 3, 4, 5]

# compaq returns new array minus nil elements
zip_codes = ["06511", "08902", "08902", nil, "10027"]
p zip_codes.compact                  # ["06511", "08902", "08902", "10027"]
p zip_codes                          # ["06511", "08902", "08902", nil, "10027"]
zip_codes.compact!
p zip_codes                          # ["06511", "08902", "08902", "10027"]
