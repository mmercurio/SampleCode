# Listing 5.1. Examining self via calls to `puts` in class and module definitions.

class C
  puts "Just started class C:"
  puts self # C
  module M
    puts "Nested module C::M:"
    puts self # C::M
  end
  puts "Back in the outer level of C:"
  puts self # C
end
