require './lib/exhibit'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  describe 'initialize' do
    it 'exsists' do
      expect(@exhibit).to be_a(Exhibit)
    end
  end

  describe 'attributes' do
    it 'has a name and a cost' do
      expect(@exhibit.name).to eq("Gems and Minerals")
      expect(@exhibit.cost).to eq(0)
    end
  end

end 