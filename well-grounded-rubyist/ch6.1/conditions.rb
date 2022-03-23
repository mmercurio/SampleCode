# if statements that succeed evalute to what is represented by the code.
# if statements that do not succeed evaluate to nil

def sign(x)
  if x < 0
    "negative"
  elsif x > 0
    "positive"
  end
end

# evaluates to "positive"
p sign(1)

# evaluates to nil
p sign(0)
