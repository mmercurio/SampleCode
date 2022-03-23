# symbols are identifiers of the form:

p  :a
p  :book
p  :"Here's how to make a symbol with spaces in it."

# symbols can be created programmatically using `to_sym` emthod
p "a".class                          # String
p "a".to_sym                         # :a
p "a".to_sym.class                   # Symbol

# convert symbol to String
p string = :a.to_s                   # "a"
p string.class                       # String

# symbols are like immutable and interned strings
# Strings are NOT interned
# https://en.wikipedia.org/wiki/String_interning

# two stirngs with same content are differnt objects
s1 = "xyz"
s2 = "xyz"
p s1.object_id                      # 60
p s2.object_id                      # 80
p s1.object_id == s2.object_id      # false
p s2.equal?(s2)                     # false

# two identical symbols are same object
sym1 = :xyz
sym2 = :xyz
p sym1.object_id                    # 1022748
p sym2.object_id                    # 1022748
p sym1.object_id == sym2.object_id  # true
p sym1.equal?(sym2)                 # true
p sym3 = s1.to_sym                  # :xyz
p sym4 = s2.to_sym                  # :xyz
p sym3.object_id                    # 1022748
p sym4.object_id                    # 1022748
p sym3.equal?(sym2)                 # true
p sym3.equal?(sym4)                 # true

# All symbols are added to:
Symbol.all_symbols # LOTS!
p Symbol.all_symbols.size           # 3123

p Symbol.all_symbols.grep(/xyz/)    # [:xyz]
# shy use `grep` and not `include` like this:
p Symbol.all_symbols.include?(:abc)  # true
# because using the iteral for the symbol will create it and it will always be true

# symbols are used in method arguments and other identifiers
# symbols are convenient for use as keys to hashes

# creating a hash using symnbols as keys
joe_hash = { :name => "Joe", :age => 36 }
p joe_hash                         # :name=>"Joe", :age=>36}
p joe_hash[:age]                   # 36

# also allowed and equivalent to the above:
p joe_hash2 = { name: "Joe", age: 36 } # {:name=>"Joe", :age=>36}
p joe_hash == joe_hash2           # true
