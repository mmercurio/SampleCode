require 'set'

# Classic pangrams solution using Ruby.

# Set of all characeters of the alphabet
ALPHA = Set.new('a'..'z')

# Returns true if text is a pangram, else false.
# If text is not a pangram, it outputs letters of the alphabet that are missing in the text.
def pangram?(text)
    # s1 is set of characters only in text - i.e. anything not a letter is removed
    s1 = (Set.new (text.downcase.split(''))) & ALPHA
    missing = ALPHA - s1
    result = missing.empty?
    if not result
        puts "Not a Pangram.", "Missing: #{missing.to_a.join('')}"
    end
    result
end

RSpec.describe 'the pangram? function returns true' do
    it 'when input is a pangram' do
        raise unless pangram?('qwertyuiopasdfghjklzxcvbnm') == true
    end

    it 'when input is a pangram with uppercase chars' do
        raise unless pangram?('QWERTYUIOPASDFGHJKLZXCVBNM') == true
    end

    it 'when input is a pangram with nonalhabetic chars' do
        raise unless pangram?(' 01234 ;,.!? qwertyuiopasdfghjklzxcvbnm') == true
    end
end

RSpec.describe 'the pangram? function returns false' do
    it 'when input is not a pangram (missing characters from the alphabet)' do
        raise unless pangram?('abcd') == false
    end
end
