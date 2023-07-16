# Experimetning with implicit blocks (e.g., yield) vs explicit block (e.g., &block and block.call)
# with and without passing args to the block, differences, similarities, and how to test via specs.
#
# The most obvious difference to me between implicit and explicit blocks is that if the code
# needs to reference the block parameter (e.g., to pass it to a method), then an explicit block
# is needed in order to get access to the block parameter. If the code is merely calling the block
# then the difference is largely sematantics and the functionality is the same.

# method that takes a block, explicitly and yields the block (i.e. calls it)
def func(&block)
  block.call
end

# > func { puts "hi" }
# hi
#  => nil

# The block parameter is REQUIRED. This doesn't work (note the reference to "yield" in the
# error message):
# 3.2.2 :016 > func
# (irb):2:in `func': no block given (yield) (LocalJumpError)
#         from (irb):16:in `<main>'
#         from ruby-3.2.2/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
#         from ruby-3.2.2/bin/irb:25:in `load'
#         from ruby-3.2.2/bin/irb:25:in `<main>'
#         from ruby-3.2.2/bin/ruby_executable_hooks:22:in `eval'
#         from ruby-3.2.2/bin/ruby_executable_hooks:22:in `<main>'

# This method also takes a block and calls it, implicitly:

def func2
  yield
end

# > func2 { puts "hi" }
# hi
# => nil

# The block parameter is also required:
# > func2
# (irb):18:in `func2': no block given (yield) (LocalJumpError)
#          from (irb):21:in `<main>'
#          from ruby-3.2.2/lib/ruby/gems/3.2.0/gems/irb-1.6.2/exe/irb:11:in `<top (required)>'
#          from ruby-3.2.2/bin/irb:25:in `load'
#          from ruby-3.2.2/bin/irb:25:in `<main>'
#          from ruby-3.2.2/bin/ruby_executable_hooks:22:in `eval'
#          from ruby-3.2.2/bin/ruby_executable_hooks:22:in `<main>'

# Methods that take arguments and then passes them to the block

def func3(args)
  yield(args)
end

# > func3("hi") do |arg|
# >   puts arg
# > end
# hi
#  => nil

# Same with explicit block:

def func4(arg, &block)
  block.call(arg)
end

# > func4("hi") do |arg|
# >   puts arg
# > end
# hi
#  => nil
