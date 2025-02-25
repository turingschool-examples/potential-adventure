require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Patron do
  before(:each) do
    @patron = Patron.new("Bob", 20)
  end

  # using name scheme has = initialized methods while can = methods

  describe "#initialization" do
    it 'initialize' do
      expect(@patron).to be_an_instance_of(Patron)
    end

    it 'has a name' do
      expect(@patron.name).to eq("Bob")
    end

    it 'has spending money' do
      expect(@patron.spending_money).to eq(20)
    end

    it 'has interests' do
      expect(@patron.interests).to eq([])
    end
  end

  it 'can add interests' do
    @patron.add_interest("Dead Sea Scrolls")
    @patron.add_interest("Gems and Minerals")
    expect(@patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end