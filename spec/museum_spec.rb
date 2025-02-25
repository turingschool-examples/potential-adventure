require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'rspec'

RSpec.describe Museum do
  before(:each)do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
  end
  describe "#initializze" do
    it 'exists and has attr' do
      expect(@dmns).to be_a(Museum)
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to eq([])
      expect(@dmns.patrons).to eq([])
    end
  end

  describe '#add_exhibit' do
    it 'adds exhibits' do
      @dmns.add_exhibit(@gems_and_minerals)
      expect(@dmns.exhibits).to eq([@gems_and_minerals])

      @dmns.add_exhibit(@dead_sea_scrolls)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls])

      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])

    end
  end

  describe 'recommend_exhibits'do
   it 'reccommend exhibits' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")

      @dmns.recommend_exhibits(@patron_1)
      @dmns.recommend_exhibits(@patron_2)

      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
   end
  end

  describe '#patronst' do
   it 'admits patrons' do
      expect(@dmns.patrons).to eq([])

      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end
  end

  describe '#dmns.patrons_by_exhibit_interest' do
    it ' returns an array' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")

      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      hash = {
         @gems_and_minerals => [@patron_1],
         @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
         @imax => []
          }
      expect(@dmns.patrons_by_exhibit_interest).to eq(hash)
    end
  end

   describe '#ticket lottery contestants' do
    it 'returns an array of intererst patron' do

      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")

      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      expeect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1])
    end
   end
end
