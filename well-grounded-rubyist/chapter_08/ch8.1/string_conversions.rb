# interpret 100 as base 17
p "100".to_i(17)             # 289

# `oct` and 'hex' for base 8 and 16
p "100".oct                  # 64
p "100".to_i(8)              # 64
p "100".hex                  # 256
p "100".to_i(16)             # 256

# floats
p "1.2345".to_f              # 1.2345

# strings (returns self)
p "Hello".to_s              # "Hello"
p "Hello".to_str            # "Hello"
s1 = "Hello"
s2 = s1.to_s
p s1 == s2                  # true
s2 = s1.to_str
p s1 == s2                  # true

# complex, rational, and others
p "-4e-2i".to_c             # (0-0.04i)
p "4.55".to_r               # (91/20)
p "abcde".to_sym            # :abcde
p "1.2345and some words".to_f # 1.2345
p "just some words".to_i    # 0

# regarding symbols (`to_sym` and `intern`)
s1 = "string"
s2 = "string"
# two strings are not the same object
p s1.equal?(s2)           # false

# two symbols are the same object
p s1.to_sym.equal?(s2.to_sym) # true
p s1.to_sym.object_id == s2.to_sym.object_id # true

# `intern` is same as `to_sym`
p s1.intern              # :string
p s1.to_sym              # :string
