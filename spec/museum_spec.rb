require './lib/museum'
require './lib/patron'
require './lib/exhibit'


RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  describe '#intialize' do
   it 'exsists' do
      expect(@dmns).to be_a(Museum)
    end
  end

  describe '#attributes' do
    it 'has a name and a cost' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to eq([])
    end
  end

  describe 'add_exhibit' do
    it 'can add exhibits' do
      expect(@dmns.exhibits).to eq([])
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end
  end

  describe '#recommend_exhibits' do
    before(:each) do
      @patron_1 = Patron.new("Bob", 20)
      @patron_2 = Patron.new("Sally", 20)

      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
    end

    it 'can recommend exhibits per interest of the patron' do
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([])

      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])

      expect(@dmns.recommend_exhibits(@patron_2)).to eq([])
      @patron_2.add_interest("IMAX")
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end
end



