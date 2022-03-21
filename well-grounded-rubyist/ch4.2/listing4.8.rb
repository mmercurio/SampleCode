# Listing 4.8. Mixing in two modules with a same-named method defined.

module M
  def report
    puts "'report' method in module M"
  end
end

module N
  def report
    puts "'report' method in module N"
  end
end

class C
  include M
  include N
end


# Which report is called? (We already know from earlier experimenting in listing4.6.rb)
c = C.new
c.report # report from module N is called.

class C2
  include M
  include N
  include M
end

# Now, which report is called?
c2 = C2.new
c2.report # Still report from N (probably because M is already in the path behind N.)
