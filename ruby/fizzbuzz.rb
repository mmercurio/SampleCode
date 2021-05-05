# A couple of FizzBuzz solutions in Ruby just for fun

# My first attempt.
# Returns classic FizzBuzz sequence of all integers between 1 and maxn, inclusive.
def fizzbuzz(maxn)
    results = []
    (1..maxn).each do |i|
        if i % 15 == 0
            results.append('fizzbuzz')
        elsif i % 3 == 0
            results.append('fizz')
        elsif i % 5 == 0
            results.append('buzz')
        else
            results.append(i)
        end
    end
    results
end

# FizzBuzz mulitples and substitution words
MULTIPLES = {
    3 => 'fizz',
    5 => 'buzz'
}

# A generic version of FizzBuzz that uses the MULTIPLES hash to control
# which multiples and their words are substitated for each number in the sequence
# between 1 and maxn, inclusive.
# Optionally, a customized multiples hash may be used for more interesteing
# varations on the classic FizzBuzz game.
def generate_fizzbuzz(maxn, multiples=MULTIPLES)
    results = []
    (1..maxn).each do |i|
        item = ''
        multiples.each do |multiple, word|
            if i % multiple == 0
                item << word
            end
        end
        if item.empty?
            results.append(i)
        else
            results.append(item)
        end
    end
    results
end

RSpec.describe 'generate_fizzbuzz' do
    it 'uses the defaults when multiples not present' do
        expect(generate_fizzbuzz(15)).to be ==
            [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']
    end

    it 'stops at maxn' do
        expect(generate_fizzbuzz(1)).to be == [1]
    end

    it 'uses an empty multiples' do
        expect(generate_fizzbuzz(15, {})).to be ==
            [1, 2, 3, 4, 5, 6 ,7, 8, 9, 10, 11, 12, 13, 14, 15]
    end

    it 'uses specified multiples' do
        specified_mulitples = { 3 => 'fizz', 4 => 'razz' }
        expect(generate_fizzbuzz(13, specified_mulitples)).to be ==
            [1, 2, 'fizz', 'razz', 5, 'fizz', 7, 'razz', 'fizz', 10, 11, 'fizzrazz', 13]
    end
end
