require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  before(:each) do
    @patron = Patron.new("Bob", 20)

  end

  describe "#initialize" do
    it 'Patron to be an instance of Patron' do

      expect(@patron).to be_an_instance_of(Patron)
    end

    it 'has a name' do
      expect(@patron.name).to eq("Bob")
    end

    it 'has money' do
      expect(@patron.spending_money).to eq(20)
    end

    it 'has an empty interest array' do
      expect(@patron.interests).to eq([])
    end

    it 'has an item in the interest array' do
      @patron.add_interest("Dead Sea Scrolls")
      @patron.add_interest("Gems and Minerals")

      expect(@patron.interests).to eq(["Dead Sea Scrolls","Gems and Minerals"])
    end

  end
end