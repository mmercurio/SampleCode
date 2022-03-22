# what happens to top-level methdods not defined in a class like this?

def talk
  puts "Hello! from talk defined in #{self}"
  p self # self is main
  puts "self is #{self.class}"
end

puts "Trying 'talk' with no receiver..."
talk

puts "Trying 'talk' with an explicit receiver.... (does not work.)"
obj = Object.new
#obj.talk
#  Results in: NoMethodError (private method `talk' called for #<Object:0x00007fee09096448>)

# predefined (built-in) top-level methods like 'puts' and 'print' are defined in the Kernel
# module which is mixed into every Object.
puts "Private insance methods from Kernel"
p Kernel.private_instance_methods.sort

# documentation here: https://ruby-doc.org/core-3.1.1/Kernel.html
