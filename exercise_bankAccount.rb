#Create a BankAccount class
class BankAccount

#Every bank account should have balance and interest_rate attributes
  def initialize(balance, interest_rate)
    @balance = balance
    @interest_rate = interest_rate
  end

# Your class should have an instance method called deposit that accepts one amount argument and adds that amount to the total balance
  def deposit(amount)
    @balance = @balance + amount
  end

# There should be a withdraw instance method that accepts one amount argument and subtracts it from the total balance
  def withdraw(amount)
    @balance = @balance - amount
  end

  # Finally, there should be a gain_interest instance method that increases the total balance according to the interest rate.
  def gain_interest
    interest_amount = (@balance * @interest_rate) / 100
    @balance = interest_amount + @balance
  end

  def give_balance
    @balance
  end

  def give_interest_rate
    @interest_rate
  end

end


# Test out your method by calling it on an instance of your class
first_call = BankAccount.new(1000, 10)
deposit_amount = 100
withdraw_amount = 60


puts "Your account currently has $#{ first_call.give_balance }, after widthdrawing $#{withdraw_amount} you will have $#{ first_call.withdraw(withdraw_amount) }."

puts "Your current balance is #{first_call.give_balance}, if you deposit #{deposit_amount}, you will have #{first_call.deposit(deposit_amount)}"

puts "Your account had $#{ first_call.give_balance }, at a rate of #{ first_call.give_interest_rate }% your new balance is $#{first_call.gain_interest}."
