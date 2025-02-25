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

  describe ''
end


