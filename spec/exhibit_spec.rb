require './lib/exhibit'

RSpec.describe Exhibit do
    before (:each) do
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end
    describe "#initialize" do
        it 'exists' do
            expect(@exhibit).to be_a(Exhibit)
            expect(Exhibit).to respond_to(:new).with(1).argument
        end
        it 'has a name' do
            expect(@exhibit.name).to eq("Gems and Minerals")
            expect(Exhibit).to respond_to(:name).with(0).arguments
        end
        
        it 'has a cost' do
            expect(@exhibit.cost).to eq(0)
        end
    end
    
end