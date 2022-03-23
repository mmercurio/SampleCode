
def block_scope_demo
  x = 100
  1.times do
    puts x
  end
end
block_scope_demo # 100

# the do-block has direct access to x and can even modify its value:
def block_scope_demo2
  x = 100
  1.times do
    x = 200
  end
  puts x
end
block_scope_demo2 # 200

# the block parameter (value between pipes) is different than non-parameter variables.
# block parmateter x below cannot be modified within the block
def block_local_parameter
  x = 100
  [1,2,3].each do |x|
    puts "Parameter x is #{x}"
    x = x + 10
    puts "Reassigned to x in block; it's now #{x}"
  end
  puts "Outer x is still #{x}" # value of x is still 100, unchanged from above.
end
block_local_parameter
