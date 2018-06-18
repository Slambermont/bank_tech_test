require 'history'

describe History do
  subject(:history) { History.new }

  describe '#initialize' do
    it 'initializes a empty history' do
      expect(history.data).to eq([])
    end
  end

  describe '#add_deposit' do
    it 'should add transaction info to history data' do
      history.add_deposit(1000, 0, '18/06/2018')
      expect(history.data).to eq([{date: '18/06/2018', credit: 1000, balance: 1000}])
    end
  end

  describe '#add_withdrawal' do
    it 'should add transaction info to history data' do
      history.add_withdrawal(300, 1000, '18/06/2018')
      expect(history.data).to eq([{date: '', debit: 300, balance: 700}])
    end
  end

  describe '#display' do
    it 'displays transaction template' do
      expect{history.display}.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'display transaction history after deposit' do
      history.add_deposit(1000, 0, '18/06/2018')
      expect{history.display}.to output("date || credit || debit || balance\n18/06/2018 || 1000 ||  || 1000\n").to_stdout
    end
  end
end
