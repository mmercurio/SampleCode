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
