class Person
  def initialize(name)
    @name = name
  end
  def inspect
    @name
  end
end

david = Person.new("David")
puts david.inspect # output: David vs
puts "David".inspect # output with quotes
