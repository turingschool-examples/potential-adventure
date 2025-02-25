require './lib/patron'

RSpec.describe Exhibit do
    before :each do
    @patron_1 = Patron.new("Bob", 20)
    end
    describe "initialize" do
        it "can initialize" do
            expect(@patron_1).to be_a(Patron)
        end
    end
    describe "attributes" do
        it "has a name" do
            expect(@patron_1.name).to eq("Bob")
        end
        it "has spending money" do
            expect(@patron_1.spending_money).to eq(20)
        end
        it "has intrest" do
            expect(@patron_1.interests).to eq([])
        end
    end
    describe "interests" do
        it "has interests" do
            @patron_1.add_interest("Dead Sea Scrolls")
            @patron_1.add_interest("Gems and Minerals")

            expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
        end
    end
end    