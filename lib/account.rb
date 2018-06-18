class Account
  attr_reader :balance, :history

  def initialize(history_class = History)
    @balance = 0
    @history = history_class.new
  end

  def deposit(amount)
    @history.add_deposit(amount, @balance)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
