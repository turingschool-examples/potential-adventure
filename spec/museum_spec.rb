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
end