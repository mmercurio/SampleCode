# XOR operations on strings with enumerators

# Listing 10.6. An exclusive-or method for strings
class String
  def ^(key)
    kenum = key.each_byte.cycle
    each_byte.map {|byte| byte ^ kenum.next }.pack("C*")
  end
end

# the ^ method XORs the string key with the current string byte-by-byte and returns a new stirng.
# kenum is an enumberator over the bytes in key
# pack turns an array into a string (treating the array of bytes as characters in this case),
# thus the return value is another string.

str = "Nice little string."
key = "secret!"
p x = str ^ key      # "=\f\x00\x17E\x18H\a\x11\x0F\x17E\aU\x01\f\r\x15K"
p orig = x ^ key     # "Nice little string."

# to handle strings with different encodings using force_encoding like this:
#     each_byte.map {|byte| byte ^ kenum.next }.pack("C*").
#       force_encoding(self.encoding)
