require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe Exhibit do 
  describe '#initialize' do
      it 'is a Exhibit' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0}) 
        expect(exhibit).to be_a(Exhibit)
      end

    describe '#attributes' do
      it 'has a name' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0}) 
        expect(exhibit.name).to eq("Gems and Minerals")
      end

      it 'has a cost' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
        expect(exhibit.cost).to eq(0)
      end
    end

    describe '#Patron' do
      xit 'is a patron' do
        patron_1 = Patron.new("Bob", 20)
        expect(patron).to be_a(Patron)
      end

      xit 'has a name' do
        patron_1 = Patron.new("Bob", 20)
        expect(patron_1.name).to eq("Bob")
      end

      xit 'has spending money' do
        patron_1 = Patron.new("Bob", 20)
        expect(patron_1.spending_money).to eq(20)
      end

      xit 'has interests' do
        patron_1 = Patron.new("Bob", 20)
        expect(patron_1.interests).to eq([])
        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")
        expect(patron_1.interests).tp eq(["Dead Sea Scrolls", "Gems and Minerals"])
      end
    end
  end
end