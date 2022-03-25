# setting encoding of source file
# Ruby uses UTF-8 by default

p __ENCODING__   # #<Encoding:UTF-8>

# try changing default by running: LANG=en_us.iso885915 ruby -e "p __ENCODING__"
# result: #<Encoding:US-ASCII>

# encoding of source file can be specified with a magic comment at the top of the file
# encoding: <ENCODING>

# for example (see file `encoding_ascii.rb``):
# encoding: ASCII

# encoding of individual strings
str = "Test string"
p str.encoding               # #<Encoding:UTF-8>

# specify string encoding
str.encode("US-ASCII")
p str                       # "Test string"
p str.encoding              # #<Encoding:UTF-8>
# make it stick!
str.encode!("US-ASCII")
p str.encoding              # #<Encoding:US-ASCII>

# encoding depending on string contents.
# Here, the string changes from US-ASCII to UTF-8 based on content.
# '\U' escape sequence allows any UTF-8 characters.
p str.encoding                   # #<Encoding:US-ASCII>
p str << ". Euro symbol: \u20AC" # "Test string. Euro symbol: €"
p str.encoding                   #<Encoding:UTF-8>
