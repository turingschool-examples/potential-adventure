require './lib/exhibit'
require './lib/museum'
require './lib/patron'

RSpec.describe Museum do
    describe '#initialize' do
        it 'exists' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns).to be_a(Museum)
        end

        it 'has attributes' do
            dmns = Museum.new("Denver Museum of Nature and Science")

            expect(dmns.name).to eq("Denver Museum of Nature and Science")
            expect(dmns.exhibits).to eq([])
            expect(dmns.patrons).to eq([])
        end
    end

    describe '#add_exhibit' do
        it 'can add exhibits' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end
    end

    describe '#recommend_exhibits' do
        it 'can reccomend exhibits based on patron interest' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 20)
            patron_2 = Patron.new("Sally", 20)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("IMAX")

            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end

    describe '#admit' do
        it 'can admit patrons to the museum' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            patron_1 = Patron.new("Bob", 20)

            dmns.admit(patron_1)

            expect(dmns.patrons).to eq([patron_1])
        end
    end

    describe '#patrons_by_exhibit_interest' do
        it 'returns a hash with exhibit keys and arrays of interested patrons as values' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 0)
            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")

            patron_2 = Patron.new("Sally", 20)
            patron_2.add_interest("Dead Sea Scrolls")

            patron_3 = Patron.new("Johnny", 5)
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.patrons_by_exhibit_interest).to eq({
                gems_and_minerals => [patron_1],
                dead_sea_scrolls => [patron_1, patron_2, patron_3],
                imax => []
            })
        end
    end

    describe '#ticket_lottery_contestants' do
        it 'returns patrons who are interested in an exhibit but do not have the spending money' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 0)
            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")

            patron_2 = Patron.new("Sally", 20)
            patron_2.add_interest("Dead Sea Scrolls")

            patron_3 = Patron.new("Johnny", 5)
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
            expect(dmns.ticket_lottery_contestants(gems_and_minerals)).to eq([])
            expect(dmns.ticket_lottery_contestants(imax)).to eq([])
        end
    end

    describe '#draw_lottery_winner' do
        it 'returns a random winner from the eligible lottery contestants' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
            dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1 = Patron.new("Bob", 0)
            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")

            patron_2 = Patron.new("Sally", 20)
            patron_2.add_interest("Dead Sea Scrolls")

            patron_3 = Patron.new("Johnny", 5)
            patron_3.add_interest("Dead Sea Scrolls")

            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)

            winner = dmns.draw_lottery_winner(dead_sea_scrolls)

            expect([patron_1.name, patron_3.name]).to include(winner) #could have maybe stubbed here
        end

        it 'returns nil if there are no patrons eligible' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})

            dmns.add_exhibit(gems_and_minerals)

            expect(dmns.draw_lottery_winner(gems_and_minerals)).to be_nil #No patrons admitted, making sure functioning properly
        end
    end

    describe '#announce_lottery_winner' do
        xit 'announces lotto winner if there is one' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            imax = Exhibit.new({name: "IMAX",cost: 15})

            dmns.add_exhibit(imax)

            allow(dmns).to receive(:draw_lottery_winner).and_return("Bob") #Do I need to specify imax somehow?

            expect(dmns.announce_lottery_winner(imax)).to eq("Bob has won the IMAX edhibit lottery")
        end

        xit 'announces no winners if no eligible patrons' do
            dmns = Museum.new("Denver Museum of Nature and Science")
            gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})

            dmns.add_exhibit(gems_and_minerals)

            expect(dmns.announce_lottery_winner(gems_and_minerals)).to eq("No winners for this lottery") #No contestants, no winners
        end
    end
end