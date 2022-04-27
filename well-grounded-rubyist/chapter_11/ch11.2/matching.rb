result = /abc/.match?("The alphabet starts with abc.")
p result # true

# =~ operator for regexp pattern matching
puts "Match!" if /abc/ =~ "The alphabet starts with abc." # Match!
puts "Match!" if "The alphabet starts with abc." =~ /abc/ # Match!

# MatchData object is returned by `match` method
p (/abc/.match("The alphabet starts with abc.")) # #<MatchData "abc">

# nil is returned if there's no match
p (/abc/.match("def")) # nil

# =~ returns the numerical index of the character where the match started:
p "The alphabet starts with abc" =~ /abc/ # 25
