# comparing
p "a" <=> "b"                      # -1
p "a" <=> "a"                      # 0
p "b" <=> "a"                      # 1
p "b" > "a"                        # true
p "." > ","                        # true

# contents equality `==` and `eql?`
p "string" == "string"             # true
p "string" == "house"              # false
p "" == ""                         # true
p "string".eql?("string")          # true

# object identity: `equal?`
p "a".equal?("a")                  # false
p "a".equal?(100)                  # false
s1 = "a"
s2 = s1
p s1.equal?(s2)                    # true
