module Stacklike
  def stack
    @stack ||= [] # or-equals operator. Set iff not already set.
  end
  def add_to_stack(obj)
    stack.push(obj)
  end
  def take_from_stack
    stack.pop
  end
end
