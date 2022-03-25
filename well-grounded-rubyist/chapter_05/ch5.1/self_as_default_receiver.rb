# If the receiver of a message is self, you can omit the receiver and the dot. Ruby
# will use `self` as the default receiver.

class C
  def C.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end
  no_dot # since self is C, this works.
end

# Here, the receiver must be specified, because there's no `no_dot` method defined outside of C
# in main at the top level of the file.
C.no_dot

# this will NOT work:
#no_dot

# useful when calling one instance method from another:
class C
  def x
    puts "This is method 'x'"
  end

  def y
    puts "This is method 'y', about to call x without a dot."
    x
  end
end

c = C.new
c.y
