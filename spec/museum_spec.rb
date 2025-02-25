require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'pry'

RSpec.describe Museum do
    before(:each) do
        @dmns = Museum.new("Denver Museum of Nature and Science")
    end
    describe "#initialize"
        it 'exists' do
            expect(@dmns).to be_a(Museum)
        end
        it 'has a name' do
            expect(@dmns.name).to eq("Denver Museum of Nature and Science")
        end
    describe "exhibits" do
        it 'has exhibits' do
            expect(@dmns.exhibits).to eq([])
        end
        it 'can add exhibits' do
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            expect(@dmns.exhibits).to eq([])

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])

        end
        it 'can recommend exhibits' do
            #add exhibits to the museum
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            @dmns.add_exhibit(gems_and_minerals)
            @dmns.add_exhibit(dead_sea_scrolls)
            @dmns.add_exhibit(imax)

            expect(@dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])

            #create patron one and add interests

            patron_1 = Patron.new("Bob", 20)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")

            #create patron two and add interests

            patron_2 = Patron.new("Sally", 20)

            patron_2.add_interest("IMAX")

            #recommend exhibits to patron one

            @dmns.recommend_exhibits(patron_1)
            expect(@dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])

            #recommend exhibits to patron two

            @dmns.recommend_exhibits(patron_2)
            expect(@dmns.recommend_exhibits(patron_2)).to eq([imax])

        end
        
    end
end