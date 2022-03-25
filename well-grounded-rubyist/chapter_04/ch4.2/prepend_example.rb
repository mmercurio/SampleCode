module MeFirst
  def report
    puts "Hello from module!"
  end
end
class Person
  prepend MeFirst
  def report
    puts "Hello from class!"
  end
end

p = Person.new
p.report # from Module because... prepend

class Person2
  include MeFirst
  def report
    puts "Hello from class!"
  end
end

p2 = Person2.new
p2.report # from class

puts "Compare Person (prepend) vs Person2 (include):"
p Person.ancestors
p Person2.ancestors
