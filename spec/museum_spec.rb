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
      expect(@dmns.patrons).to eq([])
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

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])

      expect(@dmns.recommend_exhibits(@patron_2)).to eq([])
      @patron_2.add_interest("IMAX")
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end

  describe 'iteration 3' do
    before(:each) do
      @dmns = Museum.new("Denver Museum of Nature and Science")
  
      @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      @imax = Exhibit.new({name: "IMAX",cost: 15})
  
      @patron_1 = Patron.new("Bob", 0)
      @patron_2 = Patron.new("Sally", 20)
      @patron_3 = Patron.new("Johnny", 5)
    end

    describe '#admit' do
      it 'can admit patrons' do
        expect(@dmns.patrons).to eq([])
        @patron_1.add_interest("Gems and Minerals")
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_2.add_interest("Dead Sea Scrolls")
        @patron_3.add_interest("Dead Sea Scrolls")

        @dmns.admit(@patron_1)
        @dmns.admit(@patron_2)
        @dmns.admit(@patron_3)

        expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
      end
    end

    describe '#patrons_by_exhibit_interest' do
      it 'returns a hash patrons by exhibit interests' do
        @patron_1.add_interest("Gems and Minerals")
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_2.add_interest("Dead Sea Scrolls")
        @patron_3.add_interest("Dead Sea Scrolls")

        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)

        @dmns.admit(@patron_1)
        @dmns.admit(@patron_2)
        @dmns.admit(@patron_3)

        expected_output = {
          @gems_and_minerals => [@patron_1], 
          @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
          @imax => []
        }

        expect(@dmns.patrons_by_exhibit_interest).to eq(expected_output)
      end
    end

    describe '#ticket_lottery_contestants' do
      it 'returns an array of patrons that do not have enough money to see an exhibit' do
        @patron_1.add_interest("Gems and Minerals")
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_2.add_interest("Dead Sea Scrolls")
        @patron_3.add_interest("Dead Sea Scrolls")

        @dmns.admit(@patron_1)
        @dmns.admit(@patron_2)
        @dmns.admit(@patron_3)

        expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])
      end
    end
  end
end



