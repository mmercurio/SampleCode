# Listing 5.2. Composing whole name from values, using method calls on implicit self.

class Person
  attr_accessor :first_name, :middle_name, :last_name

  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end

david = Person.new
david.first_name = "David"
david.last_name = "Black"
puts "David's whole name: #{david.whole_name}"

david.middle_name = "Alan"
puts "David's whole name: #{david.whole_name}"

# “The definition of whole_name depends on the bareword method calls to first_name,
# middle_name, and last_name being sent to self—self being the Person instance
# (david, in the example). The variable n serves as a string accumulator,
# with the components of the name added to it one by one. The return value of the
# entire method is n, because the expression n << last_name 1 has the effect of
# appending last_name to n and returning the result of that operation.
#
# In addition to serving automatically as the receiver for bareword messages,
# self also enjoys the privilege of being the owner of instance variables.”
#
# Excerpt From: The Well-Grounded Rubyist, Third Edition, David A. Black Joseph Leo III
