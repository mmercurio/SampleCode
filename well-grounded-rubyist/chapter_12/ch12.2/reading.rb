f = File.new("code/ticket2.rb")
p f  # #<File:code/ticket2.rb>
p f.read
# "# Listing 3.2 Ticket\n\nclass Ticket\n  ...
f.close

# gets to read one line
f = File.new("code/ticket2.rb")
# gets to read one line at a time: https://docs.ruby-lang.org/en/2.7.0/IO.html#method-i-gets
p f.gets # "# Listing 3.2 Ticket\n"
p f.gets # "\n"
p f.gets # "class Ticket\n"

# gets vs readline : how end of file is handled
f.read # reads in entire contents
f.gets # nil (end of file)
f.readline # raises EOFError (end of file reached)

# rewind to move File internal positionat back to beginning
# https://docs.ruby-lang.org/en/2.7.0/IO.html#method-i-rewind
f.pos # 241 (current position) https://docs.ruby-lang.org/en/2.7.0/IO.html#method-i-pos
f.rewind # 0
f.pos # 0
# readlines to read entire file as array of lines
f.readlines
# ["# Listing 3.2 Ticket\n", "\n", "class Ticket\n", "  def initialize(venue, date)\n", "    @venue = venue\n", "    @date = date\n", "  end\n", "  def price=(price)\n", "    @price = price\n", "  end\n", "  def venue\n", "    @venue\n", "  end\n", "  def date\n", "    @date\n", "  end\n", "  def price\n", "    @price\n", "  end\n", "end\n"]
f.pos # 241

# treating File as enumerable and reading in each line
f.each {|line| puts "Next line: #{line}" }

# byte and character based file reading
# getc to get character at a time
f.rewind
f.getc  # "#"

# ungetc to put character back into File stream
f.ungetc("X") # => nil
f.gets #  "X Listing 3.2 Ticket\n"

# seek to change position
# https://docs.ruby-lang.org/en/2.7.0/IO.html#method-i-seek
f.pos # 21
f.seek(20, :CUR) # seek relative to current position
f.pos # 41
f.seek(-1, :END) # seek relative to end of file
f.pos # 242
f.seek(20, :SET) # seek to aboslute position
f.pos # 20
f.rewind
f.pos # 0
f.pos = 20 # same as f.seek(20, :SET)
f.pos # 20

# Reading files with class methods
full_text = File.read("code/ticket2.rb") # reads in entire file
p full_text.size # 241
lines_of_text = File.readlines("code/ticket2.rb") # read as array of lines
p lines_of_text.length # 20
