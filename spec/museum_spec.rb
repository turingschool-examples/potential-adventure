require './lib/museum'
require './lib/patron'
require './lib/exhibit'

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
        
    end
end