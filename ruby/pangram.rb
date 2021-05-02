require 'set'

# Classic pangrams solution using Ruby.

# Set of all characeters of the alphabet
ALPHA = Set.new('a'..'z')

# Returns true if text is a pangram, else false.
# If text is not a panfram, it outputs letters of the alphabet that are missing in the text.
def pangram?(text)
    # s1 is set of characters only in text - i.e. anything not a character
    # of the alphabet is removed
    s1 = (Set.new (text.downcase.split(''))) & ALPHA
    missing = ALPHA - s1
    result = missing.empty?
    if not result
        puts "Not a Pangram.", "Missing: #{missing.to_a.join('')}"
    end
    result
end
