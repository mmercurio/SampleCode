# referring to the current class, C using `self`:

class C
  def self.x # this is the same as C.x
    puts "Class method x of class C."
    puts "  self: #{self}"
  end
end

# special notation for defining multiple class methods:
class C
  class << self # what follows are all class methods
    def y
      puts "Class method y of class #{self}"
      puts "  self: #{self}"
    end
    def z
      puts "Class method z of class #{self}"
      puts "  self: #{self}"
    end
  end
end

C.x
C.y
C.z

class D < C
end
puts "Calling D.x... "
D.x # what happens here? self is D (as expected)
