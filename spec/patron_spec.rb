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
      expect(@patron.money).to eq(20)
    end
  end
end