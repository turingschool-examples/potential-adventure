require './lib/patron'
require './lib/exhibit'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  describe '#intialize' do
   it 'exsists' do
      expect(@patron_1).to be_a(Patron)
    end
  end

  describe '#attributes' do
    it 'has a name and a cost' do
      expect(@patron_1.name).to eq("Gems and Minerals")
      expect(@patron_1.spending_money).to eq(20)
      expect(@patron_1.interests).to eq([])
    end
  end

  describe 'add_interests' do
    it 'can add interests'
      expect(@patron_1.interests).to eq([])
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end

