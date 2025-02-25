require './lib/exhibit'

RSpec.describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new
  end

  describe "#initialize" do
      it 'Exhibit to be an instance of exhibit' do

      expect(@exhibit).to be_an_instance_of(Exhibit)
    end
  end
end