class Patron
  attr_reader :name, :spending_money
  def initialize(name,spending_money)
    @name = name
    @money = spending_money
  end
end