# map aka collect
# Regardless of whatever enumerable it starts with, the result of `map` is always an Array
# of the same size as the origianl enumerable collection.

# mapping names to their uppercase equivalent:
names = %w(David Yukihiro Chad Amy)
p names
print "Map to uppercase: "
p names.map {|name| name.upcase}  # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]

print "Map to upcase using :upcase symbol instead of a block:"
p names.map(&:upcase)   # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]

# also `map!` and `collect!` that modify the original collection
p names
names.map!(&:upcase)
print "After 'map!(&upcase), origianl: "
p names # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]
