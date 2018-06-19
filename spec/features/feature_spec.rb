require './lib/account.rb'

def create_account
  account = Account.new
end

def check_balance
  account = Account.new
  account.balance
end

def make_deposit
  account = Account.new
  account.deposit(1000)
end

def make_withdrawal
  account = Account.new
  account.deposit(1000)
  account.withdraw(200)
end

def make_withdrawal_on_empty_account
  account = Account.new
  account.withdraw(200)
end

def display_transaction_history
  account = Account.new
  account.deposit(1000)
  account.withdraw(200)
  account.show_transactions
end
