# How to use an enumerator's each method
array = %w(cat dog rabbit)
e = array.map
p e # #<Enumerator: ["cat", "dog", "rabbit"]:map>
p e.each {|animal| animal.capitalize } # ["Cat", "Dog", "Rabbit"]

# un-overriding phenonenon
# Instances of clases that include `Enumerable` automatically get
# `map`, `select`, `inject` and the resto of `Enumnerable` methods.
# Those methods are all defined in terms of `each`.
#
# It's possible for a class to overrdie the `Enumerable` version of a method with its own.
# For example, `Hash#select`.
h = { cat: "feline", dog: "canine", cow: "bovine" }
p h.select {|key,value| key =~ /c/ }
# {:cat=>"feline", :cow=>"bovine"}
p e = h.enum_for(:select)
# #<Enumerator: {:cat=>"feline", :dog=>"canine", :cow=>"bovine"}:select>
p e.each { |key,value| key =~ /c/ }
# {:cat=>"feline", :cow=>"bovine"}

# Enumerator hooked up to the hash's `select` method byt using `to_enum`
# and letting the target method default to `each`:
p e = h.to_enum
# #<Enumerator: {:cat=>"feline", :dog=>"canine", :cow=>"bovine"}:each>

p e.select {|key,value| key =~ /c/ }
# [[:cat, "feline"], [:cow, "bovine"]]
# The above, results in an array instead of a hash. This is because the call to `select`
# is made on the enumumerator (`Enumerable#select`) and not on the hash (`Hash#select`).
