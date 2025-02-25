require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  before(:each)do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end
  describe "#initializze" do
    it 'exists and has attr' do
      expect(@dmns).to be_a(Museum)
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to eq([])
    end
  end
end