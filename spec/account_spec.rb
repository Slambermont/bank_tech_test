require 'account'

describe Account do
  subject(:account) { Account.new }

  describe '#initialize' do
    it 'should initialize a balance of zero' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'should increase account balance by specified amount' do
      account.deposit(1000)
      expect(account.balance).to eq(1000)
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
