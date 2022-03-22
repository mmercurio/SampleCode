# Listing 5.5. Demonstrating the generation of a new local scope per method call

class C
  def x(value_for_a,recurse=false)
    a = value_for_a
    puts "Here's obejct_id for 'self: #{self.object_id}"
    print "Here's the inspect-string for 'self':"
    p self
    puts "And here's object_id for a: #{a.object_id} and here's a:"
    puts a
    if recurse
      puts "Calling myself (recursion)..."
      x("second value for a")
      puts "Back after recursion; here's object_id for a: #{a.object_id} and a:"
      puts a

    end
  end
end

c = C.new
c.x("First value for a", true)
