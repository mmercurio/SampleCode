# Using Enumerator to protect a read-only collection from being modified.

# Listing 10.5 Safer playing cards
# using an Enumbeator to return a safe read-only reference to the
# deck of cards that cannot be modified. 

class PlayingCard
  SUITS = %w{ clubs diamons hearts spades }
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  class Deck
    def cards
      @cards.to_enum
    end
    def initialize(n=1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

deck = PlayingCard::Deck.new
# attempts to modify cards fails
#deck.cards << "Joker!!"
# ^^^ does not work! undefined method `<<' for #<Enumerator:0x00007fa118086c48> (NoMethodError)

