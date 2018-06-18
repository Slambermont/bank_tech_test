class History
  attr_reader :data

  def initialize
    @data = []
  end

  def add_deposit(amount, current_balance, date)
    new_balance = current_balance + amount
    @data << { date: date, credit: amount, balance: new_balance }
  end

  def add_withdrawal(amount, current_balance, date)
    new_balance = current_balance - amount
    @data << { date: date, debit: amount, balance: new_balance }
  end

  def display
    puts "date || credit || debit || balance"
    @data.each do |x|
      puts "#{x[:date]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}"
    end
  end
end
