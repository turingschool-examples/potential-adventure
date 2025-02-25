require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new

  end

  describe "#initialize" do
    it 'Museum to be an instance of Museum' do

      expect(@dmns).to be_an_instance_of(Museum)
    end
  end  
end  