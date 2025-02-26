require './lib/patron'

RSpec.describe Patron do
    before (:each) do
        @patron_1 = Patron.new("Bob", 20)
    end
    describe "#initialize" do
        it 'exists' do
            expect(@patron_1).to be_a(Patron)
            expect(Patron).to respond_to(:new).with(2).arguments
        end
        it 'has a name' do
            expect(@patron_1.name).to eq("Bob")
        end
        it 'has spending money' do
            expect(@patron_1.spending_money).to eq(20)
        end
    end
    describe "#patron interests" do
        it 'has interest' do
            expect(@patron_1.interests).to eq([])
        end
        it 'can add interests' do
            expect(@patron_1).to respond_to(:add_interest).with(1).argument
            expect(@patron_1.interests).to eq([])

            @patron_1.add_interest("Dead Sea Scrolls")

            expect(@patron_1.interests).to eq(["Dead Sea Scrolls"])

            @patron_1.add_interest("Gems and Minerals")

            expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end