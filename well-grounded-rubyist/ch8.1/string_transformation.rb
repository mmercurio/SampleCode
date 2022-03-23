# case transformations

string = "David A. Black"
p string.upcase                    # "DAVID A. BLACK"
p string.downcase                  # "david a. black"
p string.swapcase                  # "dAVID a. bLACK"
p string                           # Unchanged: "David A. Black"

p "david black".capitalize         # "David black"

# there are `!` versions of the above mothds to modify the string in place. e.g.
string.upcase!
p string                           # "DAVID A. BLACK"

# formatting transformations
# `rjust` and `ljust` methods expand the size of the string to the length provided by adding padding

string = "David A. Black"
p string.rjust(25)                 # "           David A. Black"
p string.ljust(25)                 # "David A. Black           "

# supply padding argument
p string.rjust(25, ".")           # "...........David A. Black"
p string.rjust(25, "><")          # "><><><><><>David A. Black"

# center
p "The middle".center(20, "*")    # "*****The middle*****"
p "The middle".center(21, "*")    # "*****The middle******"

# stripping whitespace
string = "   David A. Black   "
p string.strip                    # "David A. Black"
p string.lstrip                   # "David A. Black   "
p string.rstrip                   #    David A. Black"
# also `!` versions
string.strip!
p string                          # "David A. Black"

# content transformations

# removing characters from the ends of strings
p "David A. Black".chop           # "David A. Blac"
p "David A. Black\n".chomp        # "David A. Black"
p "David A. Black".chomp('ck')    # "David A. Bla"

p string                          # "David A. Black"
string.clear
p string                          # ""

string = "(to be named alter)"
string.replace("David A. Black")
p string                          # "David A. Black"

# deleting specific characters
p "David A. Black".delete("abc")  # "Dvid A. Blk"
p "David A. Black".delete("^abc") # "aac"
p "David A. Black".delete("a-e", "^c") # "Dvi A. Blck"

# string incrementation
p "a".succ                        # "b"
p "abc".succ                      # "abd"
p "azz".succ                      # "baa"
# `next`` is same as `succ`
p "abc".next                      # "abd"
