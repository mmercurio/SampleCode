p STDERR.class # IO
STDERR.puts("Problem!") # "Problem!" printed to STDERR

# write returns the lenght of string written
result = STDERR.write("Problem!\n")
p result # 9

# STDIN, STDOUT, STDERR are global constatnts
# $stdin, $stdout,$stderr are global variables

p STDOUT.object_id
p $stdout.object_id
p STDOUT == $stdout # true

p $stderr.object_id
p $stderr == STDOUT # false

# redirect $stderr to STDOUT
$stderr = STDOUT

# Listing 12.1 Direct all output to a single file
record = File.open("/tmp/record", "w")
old_stdout = $stdout
$stdout = record
puts "This is a record" # nothig written to screen
z = 10/0 # also nothing written here

# the output include divide by zero error written to /tmp/record
# cat /tmp/record
# This is a record
#  => nil
# Traceback (most recent call last):
#         5: from /Users/michael/.rvm/rubies/ruby-2.7.5/bin/irb:23:in `<main>'
#         4: from /Users/michael/.rvm/rubies/ruby-2.7.5/bin/irb:23:in `load'
#         3: from /Users/michael/.rvm/rubies/ruby-2.7.5/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe/irb:11:in `<top (required)>'
#         2: from (irb):27
#         1: from (irb):27:in `/'
# ZeroDivisionError (divided by 0)

# keyboard input
puts "enter a line of text:"
line = gets
p line # line is displayed
puts "enter a line of text:"
char = STDIN.getc
p char # only first char is displayed
