# Implicit creation of enumerators by blockles iterator calls

# If there's no block to yield values to, most built-in iterators
# return an enumerator when they're called without a block.
# For example:
str = "Hello"
p str
p str.each_byte {|b| puts b }
# 72
# 101
# 108
# 108
# 111
# "Hello

# if `each_byte` is called without a block this time, an enumeator is returned:
p str.each_byte
# #<Enumerator: "Hello":each_byte>

# The enumerator returned is equivalent to this:
p str.enum_for(:each_byte)
# #<Enumerator: "Hello":each_byte>
