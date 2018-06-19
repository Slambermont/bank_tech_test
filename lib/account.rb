require_relative 'history'

class Account
  attr_reader :balance, :history

  def initialize(history_class = History)
    @balance = 0
    @history = history_class.new
  end

  def deposit(amount)
    @history.add_deposit(amount, @balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Balance is too low' if amount > @balance
    @history.add_withdrawal(amount, @balance - amount)
    @balance -= amount
  end

  def show_transactions
    puts "date || credit || debit || balance"
    puts @history.display.join("\n") if @history.display != nil
  end
end
