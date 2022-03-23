# Listing 7.2. Example of a class that mixes in the Comparable module

class Bid
  include Comparable
  attr_accessor :estimate

  def <=>(other_bid)
    if self.estimate < other_bid.estimate
      -1
    elsif self.estimate > other_bid.estimate
      1
    else
      0
    end
  end
end

# <=> can be rewritten to take advantage of Integer an Float comparators

def Bid.<=>(other_bid)
  self.estimate <=> other_bid.estimate
end

bid1 = Bid.new
bid2 = Bid.new
bid1.estimate = 100
bid2.estimate = 105

p bid1 < bid2    # true
p bid2 > bid1    # true
p bid1 >= bid2   # false
p bid1 == bid2   # false
bid2.estimate = bid1.estimate
p bid1 >= bid2   # true
p bid1 == bid2   # true
