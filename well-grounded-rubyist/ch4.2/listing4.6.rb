# listing 4.6. Demonstratino of modules inclusion and inheritence.
#  I updated this to demonstrate what happens when multiple modules are
#  included in a class that define the same method. See below for demo
#  and conclusion.

module M
  def report
    puts "'report' method in module M"
  end
  def report2
    puts "'report2' method in module M"
  end
end

# What happens if another module also defines the report mothod?
module X
  def report
    puts "'report' method in module X"
  end
  def report2
    puts "'report2' method in module X"
  end
end

class C
  include M
end

class D < C
  include X
end

obj = D.new
obj.report # report from X is called


# What happens if both M and X are included? (Spoiler: X is called)
class E
  include M, X
end

puts "now calling report2 on E"
e_obj = E.new
e_obj.report2 # report2 from X is called


# what happens if X is included before M? (Spoiler: M is called)
class F
  include X, M
end

puts "now calling report2 on F"
f_obj = F.new
f_obj.report2 # report2 from M is called

# conclusion: when multiple modules are included that define the same method, the method
# from the most recent (last to be included) module is called.
# And this is discussed in the next section of the chapter:
#   4.2.2 Defining the same method more than once. See also listing 4.7.
