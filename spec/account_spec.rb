require 'account'

describe Account do
  subject(:account) { Account.new(history_class) }
  let(:history_class) { double :history_class, new: history }
  let(:history) { double :history, add_deposit: nil, add_withdrawal: nil, display: nil }

  describe '#initialize' do
    it 'should initialize a balance of zero' do
      expect(account.balance).to eq(0)
    end

    it 'should initialize an instance of History' do
      expect(account.history).to eq(history)
    end
  end

  describe '#deposit' do
    it 'should increase account balance by specified amount' do
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end

    it 'should record transaction in history' do
      expect(history).to receive(:add_deposit).with(1000, 1000)
      account.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'should decrease account balance by specified amount' do
      account.deposit(1000)
      account.withdraw(300)
      expect(account.balance).to eq(700)
    end

    it 'should record transaction in history' do
      account.deposit(1000)
      expect(history).to receive(:add_withdrawal).with(300, 700)
      account.withdraw(300)
    end

    it 'should raise an error if balance is too low' do
      account.deposit(200)
      expect { account.withdraw(500) }.to raise_error 'Balance is too low'
    end
  end

  describe '#show_transactions' do
    it 'displays transaction template' do
      expect { account.show_transactions }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'calls display on account history' do
      expect(history).to receive(:display)
      account.show_transactions
    end
  end
end
