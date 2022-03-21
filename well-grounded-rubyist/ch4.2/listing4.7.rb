# Listing 4.7. Two same-name methods on a single search path
module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in the module InterestBearing."
  end
end
class BankAccount
  include InterestBearing
  def calculate_interest
    puts "Placeholder! We're in class BankAccount."
    puts "And we're overriding the calculate_interest method..."
    puts "which was defined in the InterestBearing module."
  end
end

account = BankAccount.new
account.calculate_interest # defined in BankAccount is called.
