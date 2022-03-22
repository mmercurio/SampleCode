# Listing 5.9. Example of a protected method and its use

class C
  def initialize(n)
    @n = n
  end

  def n
    @n
  end

  def compare(c)
    if c.n > n
      puts "The other object's n is bigger."
    else
      puts "The other object's n is the same or smaller."
    end
  end

  protected :n
end

c1 = C.new(100)
c2 = C.new(101)
c1.compare(c2)

# Cannot access `n` directly from outside of C like this beacuse `n`` is protected:
#c1.n
# Results in:
#   NoMethodError (protected method `n' called for #<C:0x00007fcb898fb3d8 @n=100>)

# However, a subclass D could access n
class D < C
  def show_n
    puts "D.n=#{n}"
  end
end

puts "class D has access to n:"
d1 = D.new(102)
p d1
d1.show_n
