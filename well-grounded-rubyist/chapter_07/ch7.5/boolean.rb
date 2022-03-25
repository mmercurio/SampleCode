if (class MyClass end) # false
  puts "Empty class definition is true!"
else
  puts "Empty class definition is false!"
end

if (class MyClass; 1; end) # true
  puts "Class definition with the number 1 in it is true!"
else
  puts "Class definition with the number 1 in it is false! "
end

if (def m; return false; end) # true
  puts "method definition is true!"
else
  puts "method definition is false!"
end

if "string" # true
  puts "Strings appear to be true!"
else
  puts "Strings appear to be false!"
end

if 100 > 50 # true
  puts "100 is greater than 50!"
else
  puts "100 is not greater than 50!"
end

if nil  # false
  puts "nil is true!"
else
  puts "nil is false!"
end

puts true.class  # TrueClass
puts false.class # FalseClass
