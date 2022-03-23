a = Object.new
b = Object.new

p a == a       # true
p a == b       # false
p a != b       # true
p a.eql?(a)    # true
p a.eql?(b)    # false
p a.equal?(a)  # true
p a.equal?(b)  # false

string1 = "text"
string2 = "text"
p string1 == string2      # true
p string1.eql?(string2)   # true (comparing content)
p string1.object_id
p string2.object_id       # different object
p string1.equal?(string2) # false (comparing reference to object instance)

p 5 == 5.0     # true
p 5.eql?(5.0)  # false
