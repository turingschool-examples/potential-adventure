require './lib/patron'
require './lib/exhibit'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  describe 'intialize' do
   it 'exsists' do
      expect(@patron_1).to be_a(Patron)
    end
  end

  describe 'attributes' do
    it 'has a name and a cost' do
      expect(@patron_1.name).to eq("Gems and Minerals")
      expect(@patron_1.age).to eq(20)
    end
  end

end

