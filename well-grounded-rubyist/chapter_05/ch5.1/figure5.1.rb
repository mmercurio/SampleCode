# Figure 5.1. The determination of self in different contexts

puts "Top Level:"
puts "  self is #{self}" # self is main
puts "  self.class is #{self.class}"

class C
  puts "Class definition block:"
  puts "  self is #{self}" # self is Class c
  puts "  self.class is #{self.class}"

  def self.x
    puts "Class method C.x:"
    puts "  self is #{self}" # self is class C
    puts "  self.class is #{self.class}"
  end

  def m
    puts "Instance method C#m:"
    puts "  self is #{self}" # self is an instance of C
    puts "  self.class is #{self.class}"
  end
end

C.x
c1 = C.new
c1.m
