# Creating ranges

# two dots for inclusive range (i.e. closed interval)
p r = Range.new(1,100)             # 1..100
p r = 1..100                       # 1..100
p (1..3).to_a                      # [1, 2, 3]

# three dots for exclusive range (i.e., open interval)
p (1...3).to_a                     # [1, 2]

# Create exclusive reange with Range.new
p  Range.new(1, 100, true)         # [1...100]

# querying range
r = 1..10
p r.begin                          # 1
p r.end                            # 10
p r.exclude_end?                   # false

r = 1...10
p r.begin                          # 1
p r.end                            # 10
p r.exclude_end?                   # true

# cover? does argument lie within the range?
# True if argument >= begin <= end for inclusive range.
# True if argument >= begin < end for exclusive range.
r = "a".."z"
p r.cover?("a")                    # true
p r.cover?("z")                    # true
p r.cover?("abc")                  # true
p r.cover?("A")                    # false

r = "a"..."z"
p r.cover?("z")                    # false

# testing range inclusion with include?
# include? is stricting than cover?
r = "a".."z"
p r.include?("abc")                  # false
p r.include?("a")                    # true
p r.include?("z")                    # true

# Backward ranges
r = 100..1
p r.begin                            # 100
p r.end                              # 1

# other methods don't work as expected
p r.to_a                             # []
p r.cover?(50)                       # false
# 50 is neither >- 100 (r.begin), nor < 1 (r.end).
