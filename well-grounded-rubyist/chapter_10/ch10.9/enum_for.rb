# Attaching enumerators to other objects
# https://ruby-doc.org/core-2.7.0/Enumerator/Lazy.html#method-i-enum_for
# https://ruby-doc.org/core-2.7.0/Enumerator/Lazy.html#method-i-to_enum

# calling `enum_for`, providing the first argument the name of the method
# onto which the enumerator will watch its `each` method. This argument
# defaults to `:each`.
names = %w(David Black Yukihiro Matsumoto)
p names                                     # "David", "Black", "Yukihiro", "Matsumoto"]
e = names.enum_for(:select)

# specifying `select` as the argument means we want to bind this enumerator to the `select method
# of the `names` array. This, the enumerator's `each` will serve as a kind of front end
# to the array's `select`

p e.to_a                                   # ["David", "Black", "Yukihiro", "Matsumoto"]
p e.each {|n| n.include?('a')}             # ["David", "Black", "Matsumoto"]

# additional arguments to `enum_for` are passed through to the method to which the
# enumerator is being attached. For example:
p e = names.enum_for(:inject, "Names: ")
# #<Enumerator: ["David", "Black", "Yukihiro", "Matsumoto"]:inject("Names: ")>
p e.each {|string, name| string << "#{name}..."}
# "Names: David...Black...Yukihiro...Matsumoto..."
p e.to_a  # What happens?
# [["Names: David...Black...Yukihiro...Matsumoto...", "David"], [nil, "Black"], [nil, "Yukihiro"], [nil, "Matsumoto"]]

p e.each {|string,name| string << "#{name}..."}
# "Names: David...Black...Yukihiro...Matsumoto...David...Black...Yukihiro...Matsumoto..."
