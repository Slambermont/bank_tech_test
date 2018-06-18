class History
  attr_reader :data

  def initialize
    @data = []
  end

  def display
    'date || credit || debit || balance'
  end
end
