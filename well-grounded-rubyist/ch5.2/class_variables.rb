class Parent
  @@value = 100
end

class Child < Parent
  @@value = 200 # same class variable as above, now changes to value 200
end

class Parent
  puts @@value
end

# 200 is printed when this code runs because there is only a single class variable, @@value,
# that's refers to the exact same variable in Child and Parent.
