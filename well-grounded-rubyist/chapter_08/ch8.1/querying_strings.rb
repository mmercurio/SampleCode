# Boolean string queries
string = "Ruby is a cool language."
p string.include?("Ruby")          # true
p string.include?("English")       # false
p string.start_with?("Ruby")       # true
p string.end_with?("!!!")          # false

# start_with? supports regular expressions
p string.start_with?(/[A-Z]/)      # true

# testing for empty string (abesence of content)
p string.empty?                    # false
p "".empty?                        # true
p " ".empty?                       # false

# content length (these are the same)
p string.size                      # 24
p string.length                    # 24

# how many times a given letter or set of letters occur
p string.count("a")                # 3
# count range of letters
p string.count("g-m")              # 5
# count specific characters
p string.count("aey. ")            # 10

# negate search: count characters that dont' match
p string.count("^aey. ")           # 14
p string.count("^g-m")             # 19
p string.count("^g-m") + string.count("g-m") == string.size # true
p string.count("ag-m")             # 8
p string.count("ag-m", "^l")       # count "a" and "g-m" except "l": 6

# index method
p string.index("cool")             # 10
p string.index("l")                # 13
p string.rindex("l")               # 15

# ord method to get ordinal code
p "a".ord                          # 97

# ord for longer string returns ord of first character
p "abc".ord                        # 97

# chr method is reverse of ord
p 97.chr                           # "a"
