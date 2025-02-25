require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
    before (:each) do
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end
    describe "#initialize" do
        it 'exists' do
            expect(@exhibit).to be_a(Exhibit)
        end
    end
end