require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'pry'

RSpec.describe Museum do
    before :each do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    end
    describe 'initialize' do
        it "can initialize" do 
            expect(@dmns).to be_a(Museum)
        end
    end
    describe "attributes" do
        it "has a name" do
            expect(@dmns.name).to eq("Denver Museum of Nature and Science")
        end
        it "can have exhibits" do
            expect(@dmns.exhibits).to eq([])
        end
    end
    describe "adding exhibits" do
        it "can add exhibits" do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end
    end
    describe "patrons can have interest" do
        it "add interest to patrons" do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 20)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")

            patron_2 = Patron.new("Sally", 20)

            patron_2.add_interest("IMAX")
            
            expect(@dmns.recommend_exhibit(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(@dmns.recommend_exhibit(patron_2)).to eq([imax])
        end
    end
    describe "admit" do
        it "can admit" do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.patrons).to eq([])

            patron_1 = Patron.new("Bob", 0)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")

             patron_2 = Patron.new("Sally", 20)

            patron_2.add_interest("Dead Sea Scrolls")

            patron_3 = Patron.new("Johnny", 5)

            patron_3.add_interest("Dead Sea Scrolls")

            @dmns.admit(patron_1)
            @dmns.admit(patron_2)
            @dmns.admit(patron_3)

            expect(@dmns.patrons).to eq([patron_1, patron_2, patron_3])
        end
    end
    describe "patron by intrest" do 
        it "can see patron by exhibit" do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.patrons).to eq([])

            patron_1 = Patron.new("Bob", 0)

            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")

             patron_2 = Patron.new("Sally", 20)

            patron_2.add_interest("Dead Sea Scrolls")

            patron_3 = Patron.new("Johnny", 5)

            patron_3.add_interest("Dead Sea Scrolls")

            @dmns.admit(patron_1)
            @dmns.admit(patron_2)
            @dmns.admit(patron_3)
           #binding.pry
            expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
        end
    end
    describe "lottery contestants" do
        it "can see how has enough money"
        
    end
end        