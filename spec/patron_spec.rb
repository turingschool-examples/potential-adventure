require './lib/patron'

RSpec.describe Patron do
  before(:each)do
    @patron = Patron.new("Bob", 20)
  end
  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@patron).to be_a(Patron)
      expect(@patron.name).to eq("Bob")
      expect(@patron.spending_money).to eq(20)
    end
  end

end