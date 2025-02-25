require './lib/museum'
require './lib/patron'
require './lib/exhibit'


RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  describe '#intialize' do
   it 'exsists' do
      expect(@dmns).to be_a(Museum)
    end
  end

  describe '#attributes' do
    it 'has a name and a cost' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to eq([])
    end
  end
end


