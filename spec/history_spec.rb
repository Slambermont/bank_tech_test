require 'history'
require 'timecop'

describe History do
  subject(:history) { History.new }

  describe '#initialize' do
    it 'initializes a empty history' do
      expect(history.data).to eq([])
    end
  end

  describe '#add_deposit' do
    it 'should add transaction info to history data' do
      Timecop.freeze(Time.local(2012, 01, 10))
      history.add_deposit(1000, 1000)
      expect(history.data).to eq([{ date: '10/01/2012', credit: '1000.00', balance: '1000.00' }])
    end
  end

  describe '#add_withdrawal' do
    it 'should add transaction info to history data' do
      Timecop.freeze(Time.local(2012, 01, 14))
      history.add_withdrawal(500, 2500)
      expect(history.data).to eq([{ date: '14/01/2012', debit: '500.00', balance: '2500.00' }])
    end
  end

  describe '#display' do

    it 'display transaction history after deposit' do
      Timecop.freeze(Time.local(2012, 01, 10))
      history.add_deposit(1000, 1000)
      expect(history.display).to eq(["10/01/2012 || 1000.00 ||  || 1000.00"])
    end

    it 'display transaction history after withdrawal' do
      Timecop.freeze(Time.local(2012, 01, 10))
      history.add_deposit(1000, 1000)
      Timecop.freeze(Time.local(2012, 01, 13))
      history.add_deposit(2000, 3000)
      Timecop.freeze(Time.local(2012, 01, 14))
      history.add_withdrawal(500, 2500)
      expect(history.display).to eq(["14/01/2012 ||  || 500.00 || 2500.00", "13/01/2012 || 2000.00 ||  || 3000.00", "10/01/2012 || 1000.00 ||  || 1000.00"])
    end
  end
end
