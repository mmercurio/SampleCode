# heredocs, by default perserve leading whitespace and support escapes
# and string interpolation like double quoted strings.
text = <<EOM
This is the first line of text
This is the second line.
   This line is indented.

   The above line is blank.
Lots of "unusual" characters: ' { }, \nEscape symbols...\tappaer to work!
So does string interpolation: 1+2+3=#{1+3+3}
EOM
puts text

# squiggly heredoc, which strips leading whitespace

class RubyWelcomeWagon
  def RubyWelcomeWagon.message1
    # This text is exact with all leading whitespace.
    <<-EOM
      Welcome to the world of Ruby!
      We're happy you're here.
         -And I'm happy to be here.
    EOM
  end
  def RubyWelcomeWagon.message2
    # this text has no leading whitespace.
    <<~EOM
      Welcome to the world of Ruby!
      We're happy you're here.
         -And I'm happy to be here.
    EOM
  end
end

# compare message1 vs message2
puts RubyWelcomeWagon.message1
puts RubyWelcomeWagon.message2

# single quoted heredoc:
single_quoted = <<-'EOM'
Single Quotes!
Note the literal newline (\n)
And literal #{2+2} which is not interpolated.
EOM
puts single_quoted

# using result of heredoc in further evalation:
a = <<EOM.to_i * 10
5
EOM
puts a # 50

# heredoc in literal object constructor
array = [1,2,3, <<EOM, 4]
This is the heredoc!
It becomes array[3].
EOM
p array # [1, 2, 3, "This is the heredoc!\nIt becomes array[3].\n", 4]

# heredoc as method argument
puts("HTTP", "GET", <<EOM)
http://somehost.net/api/some_very_long_url_or_other_text_best_put_on_its_own_line
EOM

# string manipulatoin
string = "Ruby is a cool language."
p string[5]                  # "i"
p string[-12]                # "o"
p string[5,10]               # "is a cool "
p string[7...14]             # " a cool"
p string[-12..-3]            # "ol languag"
p string[-12..20]            # "ol langua"
p string[15...-1]            # "language"

# substrings based on explicit substring search
p string["cool lang"]        # "cool lang"
p string["very cool lang"]   # nil

# serach of pattern match using [] with regular experssion
p string[/c[ol ]+/]  # " cool l"

# using `slice` method instead of [] and also receiver-changing `slice!`
p string.slice("cool ")      # "cool "
p string                     # unchanged: "Ruby is a cool language."
p string.slice!("cool ")     # "cool " and also string modified to:
p string                     # "Ruby is a language."

# set part of a string to a new value using `[]=` method
string = "Ruby is a cool language."
p string["cool"] = "great"   # "great"
p string                     # "Ruby is a great language."
p string[-1] = "!"           # "!"
p string                     # "Ruby is a great language!"
p string[-9..-1] = "thing to learn!" # "thing to learn!"
p string                     # "Ruby is a great thing to learn!"

# combining strings (always returns new string)
p "a" + "b"                  # "ab"
p "a" + "b" + "c"            # "abc"

# append to string
str = "Hi "
str << "there."
p str                        # "Hi there."

# String combination via interpolation
str = "Hi "
p "#{str}there."             # "Hi there."
p str                        # "Hi "
p "The sum is #{2 + 2}."      # "This sum is 4."

# Code inside string inerpolation can be anything
p "My name is #{
  class Person
    attr_accessor :name
  end
  d = Person.new
  d.name = "David"
  d.name
}." # "My name is David."
