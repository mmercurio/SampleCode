Computer = Struct.new(:os, :manufacturer)
laptop1 = Computer.new("linux", "Lenovo")
laptop2 = Computer.new("macOS", "Apple")
p [laptop1, laptop2].map { |laptop| laptop.to_a }

# calling to_a on each Struct converts the Struct object to an array with each instance variable
# an item in the array.

array = [1,2,3,4,5]
p array     # 1, 2, 3, 4, 5]
p [array]   # [[1, 2, 3, 4, 5]]
p [*array]  # [1, 2, 3, 4, 5]

p 1 + "2".to_i   # convert String to Integer
p "doesn't work".to_i  # 0
p "123 what's this?".to_i # 123
p "1 huh 234".to_i # 1

p "hello".to_f      # 0.0
p "1.34hello".to_f  # 1.34

# These raise errors:
#  Integer("123abc")  # ArgumentError (invalid value for Integer(): "123abc")
#  Float("-3xyz")     # ArgumentError (invalid value for Float(): "-3xyz")

# objects that response to `to_str` will be able to contact with other srings. Example:

class Person
  attr_accessor :name, :age, :email
  def to_str
    name
  end
  def to_ary
    [name, age, email]
  end
end

david = Person.new
david.name = "David"
puts "david is named " + david + "."

# likewise to_ary can convert to array
david.age = 55
david.email = "david@wherever"
array = []
array.concat(david)
p array # ["David", 55, "david@wherever"]
