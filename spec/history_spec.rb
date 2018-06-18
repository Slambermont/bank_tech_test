require 'history'

describe History do
  subject(:history) { History.new }

  describe '#initialize' do
    it 'initializes a empty history' do
      expect(history.data).to eq([])
    end
  end

  describe '#display' do
    it 'displays transaction template' do
      expect(history.display).to eq('date || credit || debit || balance')
    end
  end
end
