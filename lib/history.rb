class History
  attr_reader :data

  def initialize
    @data = []
  end

  def add_deposit(amount, current_balance, date = current_date)
    new_balance = current_balance + amount
    @data << { date: date, credit: ('%.2f' % amount), balance: ('%.2f' % new_balance) }
  end

  def add_withdrawal(amount, current_balance, date = current_date)
    new_balance = current_balance - amount
    @data << { date: date, debit: ('%.2f' % amount), balance: ('%.2f' % new_balance) }
  end

  def display
    puts "date || credit || debit || balance"
    @data.each do |x|
      puts "#{x[:date]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}"
    end
  end

  private

  def current_date
    Time.now.strftime("%d/%m/%Y")
  end
end
