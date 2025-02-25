require './lib/museum'
require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe Museum do 
  describe '#initialize' do
    it 'is a Museum' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_a(Museum)
    end

    it 'has a name' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it 'has exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end
  end

  describe '#initialize' do
    it 'is an Exhibit' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_a(Museum)
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      expect(gems_and_minerals).to be_a(Exhibit)
      expect(dead_sea_scrolls).to be_a(Exhibit)
      expect(imax).to be_a(Exhibit)
    end

    it 'adds exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_a(Museum)
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      expect(gems_and_minerals).to be_a(Exhibit)
      expect(dead_sea_scrolls).to be_a(Exhibit)
      expect(imax).to be_a(Exhibit)

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
    end
  end 

  describe '#Patron' do
    it 'adds more patrons and interests' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_a(Museum)
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      expect(gems_and_minerals).to be_a(Exhibit)
      expect(dead_sea_scrolls).to be_a(Exhibit)
      expect(imax).to be_a(Exhibit)
     

      patron_1 = Patron.new("Bob", 20)
      expect(patron_1).to be_a(Patron)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      patron_2 = Patron.new("Sally", 20)
      expect(patron_2).to be_a(Patron)
      patron_2.add_interest("IMAX")
    end

    it 'recommends exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns).to be_a(Museum)
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      expect(gems_and_minerals).to be_a(Exhibit)
      expect(dead_sea_scrolls).to be_a(Exhibit)
      expect(imax).to be_a(Exhibit)

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
     
      patron_1 = Patron.new("Bob", 20)
      expect(patron_1).to be_a(Patron)
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      patron_2 = Patron.new("Sally", 20)
      expect(patron_2).to be_a(Patron)
      patron_2.add_interest("IMAX")

      expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
      expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
    end
  end
end