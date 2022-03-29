# Strings as quasi-enumerables

# `String#each_byte` provides `each` like iterations on characters in a String:
str = "abcdef"
puts "iterate over bytes in string '#{str}': "
str.each_byte { |byte| p byte }
# 97
# 98
# 99
# 100
# 101
# 102

# use `each_char` to iterate as characters:
puts "iterate over chars in string '#{str}': "
str.each_char { |char| p char }
# "a"
# "b"
# "c"
# "d"
# "e"
# "f"

str = "100\u20ac"
puts "iterate over codepoints in string '#{str}': "
str.each_codepoint { |cp| p cp }
# 49
# 48
# 48
# 8364

puts "iterate over bytes in string '#{str}':"
str.each_byte { |byte| p byte }
# 49
# 48
# 48
# 226
# 130
# 172

puts "iterate over chars in string '#{str}':"
str.each_char { |char| p char }
# "1"
# "0"
# "0"
# "€"

# `each_line` to iterate string by line
str = "This string\nhas three\nlines."
puts "iterate over lines in `#{str}':"
str.each_line {|line| p line}
# "This string\n"
# "has three\n"
# "lines."

# obtain an array of chars, bytes, codepoints from string using:
#  String#chars
#  String#bytes
#  String@codepoints
str = "Hello"
p str
print "As bytes: "
p str.bytes # [72, 101, 108, 108, 111]

print "As chars: "
p str.chars # ["H", "e", "l", "l", "o"]
