require 'account'

describe Account do
  subject(:account) { Account.new(history_class) }
  let(:history_class) { double :history_class, new: history }
  let(:history) { double :history, add_deposit: nil }

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
      expect(history).to receive(:add_deposit).with(1000, 0)
      account.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'should decrease account balance by specified amount' do
      account.deposit(1000)
      account.withdraw(300)
      expect(account.balance).to eq(700)
    end
  end
end
