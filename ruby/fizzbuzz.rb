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

# FizzBuzz mulitples and substituion words
MULTIPLES = {
    3 => 'fizz',
    5 => 'buzz'
}

# generic version that uses MULTIPLES hash to control
# which multiples and their words are substitated for
# each number in the sequence
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
