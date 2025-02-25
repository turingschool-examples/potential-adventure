require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  describe "#initialize" do
    it 'Museum to be an instance of Museum' do

      expect(@dmns).to be_an_instance_of(Museum)
    end

    it 'has an empty exhibits array' do
      expect(@dmns.exhibits).to eq([])
    end
  end  
  describe "#add_exhibit" do
    it 'adds an exhibit to the museum' do
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dmns.add_exhibit(@gems_and_minerals)
      expect(@dmns.exhibits).to include(@gems_and_minerals)
    end
  end  
end  