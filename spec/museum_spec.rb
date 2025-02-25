require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX", cost: 15})
    @patron_1 = Patron.new("Bob", 0)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
    @patron_4 = Patron.new("Morgan", 15)
    @patron_5 = Patron.new("TJ", 7)
  end

  describe "#initialization" do
    it 'initialize' do
      expect(@dmns).to be_an_instance_of(Museum)
    end

    it 'has a name' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it 'has no exhibits' do
      expect(@dmns.exhibits).to eq([])
    end

    it 'has no patrons' do
      expect(@dmns.patrons).to eq([])
    end

    it 'has no revenue' do
      expect(@dmns.revenue).to eq(0)
    end

    it 'has patrons in exhibits' do
      expect(@dmns.patrons_in_exhibits).to eq(Hash.new { |hash, key| hash[key] = [] })
    end
  end

  describe "#exhibit" do
    it 'can add exhibits' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end

    it 'can recommend exhibits' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end

  describe "#patron" do
    it 'can admit patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end

    it 'can list patrons' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      result = { # easier than having all this on one line. Learned to use this method from yesterday when working on project.
        @gems_and_minerals => [@patron_1],
        @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
        @imax => []
      }
      expect(@dmns.patrons_by_exhibit_interest).to eq(result)
    end
  end

  describe "#lottery" do
    it 'can list lottery contestants' do
      @dmns.add_exhibit(@dead_sea_scrolls)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_3)
      expect(@dmns.ticket_lottery_contestants(@dead_sea_scrolls)).to eq([@patron_1, @patron_3])
    end

    it 'can draw a lottery' do
      @dmns.add_exhibit(@dead_sea_scrolls)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_3)

      # had to use satisfy because the winner could be either patron_1 or patron_3, so I had to check if the winner was either of them.
      # i could have used mock/stubs instead like this
      # allow(museum).to receive(:draw_lottery_winner).with(exhibit).and_return(patron_1)
      # allow(museum).to receive(:draw_lottery_winner).with(exhibit).and_return(patron_3)
      # but I wanted to use satisfy instead.
      
      expect(@dmns.draw_lottery_winner(@dead_sea_scrolls)).to satisfy { |winner| [@patron_1.name, @patron_3.name].include?(winner) }
    end

    it 'can announce a lottery' do
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("IMAX")
      @dmns.admit(@patron_1)
      # this time we will use mock/stubs
      allow(@dmns).to receive(:draw_lottery_winner).with(@imax).and_return("Bob")
      expect(@dmns.announce_lottery_winner(@imax)).to eq("Bob has won the IMAX exhibit lottery")
    end

    it 'can announce no winner' do
      @dmns.add_exhibit(@gems_and_minerals)
      expect(@dmns.announce_lottery_winner(@gems_and_minerals)).to eq("No winners for this lottery")
    end
  end

  describe "#attend_exhibits" do
    it 'patrons attend exhibits based on interests and spending money' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_5.add_interest("IMAX")
      @patron_5.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_5)
      expect(@patron_5.spending_money).to eq(7)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("IMAX")
      @dmns.admit(@patron_1)
      expect(@patron_1.spending_money).to eq(0)

      @patron_2.add_interest("IMAX")
      @patron_2.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_2)
      expect(@patron_2.spending_money).to eq(5)

      @patron_4.add_interest("Gems and Minerals")
      @patron_4.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_4)
      expect(@patron_4.spending_money).to eq(5) # these are just sanity checks so we know the patrons are spending money correctly

      results = {
        @dead_sea_scrolls => [@patron_1, @patron_4],
        @imax => [@patron_2],
        @gems_and_minerals => [@patron_4]
      }
      expect(@dmns.patrons_in_exhibits).to eq(results)
    end

    # not gonna bother throwing into a describe block because it's just one test
    it 'calculates revenue' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("IMAX")
      @dmns.admit(@patron_1)

      @patron_2.add_interest("IMAX")
      @patron_2.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_2)

      @patron_4.add_interest("Gems and Minerals")
      @patron_4.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_4)

      expect(@dmns.revenue).to eq(35) # 10 + 15 + 10
    end
  end
end