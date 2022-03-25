# creating new hash

# construct an empty hash
h1 = {}
h2 = Hash.new
h3 = Hash []
p h1.size  # 0
p h2.size  # 0
p h3.size  # 0

# using [] from array of key, value paris. The array MUST be an even number of arguments.
p Hash["Connecticut", "CT", "Delaware", "DE"] # {"Connecticut"=>"CT", "Delaware"=>"DE"}
p Hash[ [[1,2], [3,4], [5,6]] ]               # {1=>2, 3=>4, 5=>6}

# adding key/value pairs
state_hash = {}
p state_hash["New York"] = "NY"               # "NY"
p state_hash                                  # {"New York"=>"NY"}
p state_hash.store("Connecticut", "CT")       # "NJ"
p state_hash                                  # {"New York"=>"NY", "Connecticut"=>"CT"}

# retriving values
p state_hash["New York"]                      # "NY"
p state_hash.fetch("Connecticut")             # "CT"

# [] returns nil for nonexistent keys. fetch raises an exception fr nonexisent keys.
p state_hash["Nebraska"]                     # nil
# state_hash.fetch("Wyoming")                # KeyError (key not found: Wyoming)

# fetch allows default value if key not found
p state_hash.fetch("Nebraska", "Unknown state")  # "Unknonw state"

# retriving multiple keys in single operation
state_hash = { "New Jersey" => "NJ",
               "Connecticut" => "CT",
               "Delaware" => "DE" }
two_states = state_hash.values_at("New Jersey", "Delaware")
p two_states                              # ["NJ", "DE"]
# unkown keys will raise KeyError
# state_hash.values_at("New Jersey", "Wyoming")    # KeyError (key not found: "Wyoming")

contacts = {
  john: {
    phone: "555-1234",
    email: "john@example.com"},
  eric: {
    phone: "555-1235",
    email: "eric@example.com"}}

p contacts.dig(:eric, :email)          # "eric@example.com"

# specify default value for nonexistent key upon construction
h = Hash.new(0)  # 0 will be default
p h["no such key!"] # 0

# default can also be a block. For examplle to add new keys with the default value 0:
h = Hash.new { |hash,key| hash[key] = 0 }
p h["new key!"]                       # 0
p h                                   # {"new key!"=>0}

# combining hashes

# update is descructive
h1 = { first: "Joe", last: "Leo", suffix: "III" }
h2 = { suffix: "Jr." }
h1.update(h2)
p h1[:suffix]                        # "Jr.""

# merge is nondescructive
h1 = { first: "Joe", last: "Leo", suffix: "III" }
h2 = { suffix: "Jr." }
h3 = h1.merge(h2)
p h1[:suffix]                        # "III"

# merge! is the same as update

# transformations

# select to drive subhash from existing hash
p h = Hash[1,2,3,4,5,6]              # {1=>2, 3=>4, 5=>6}
p h.select {|k,v| k > 1 }            # {3=>4, 5=>6}

# reject is opposite of select
p h.reject {|k,v| k > 1 }            # {1=>2}

# compact to remove keys with nil values
h = { street: "127th Street", apt: nil, borough: "Manhattan" }
p h.compact                         # {:street=>"127th Street", :borough=>"Manhattan"}

# Inverting a hash with invert to flip keys and values
h = { 1 => "one", 2 => "two" }
p h.invert                         # {"one"=>1, "two"=>2}

# clear the heash
p h.clear                          # {}

# replace
h = { 1 => "one", 2 => "two" }
p h.replace({10 => "ten", 20 => "twenty"})   # {10=>"ten", 20=>"twenty"}

# Hashes and special final  method argument
# If the final argument in a method is a hash, Ruby allows the hash without the curl braces
