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
      history.add_deposit(1000, '18 June 2018', 0)
      expect(history.data).to eq([{date: '18 June 2018', credit: 1000, balance: 1000}])
    end
  end

  describe '#display' do
    it 'displays transaction template' do
      expect(history.display).to eq('date || credit || debit || balance')
    end
  end
end
