class Patron
  attr_reader :name, :spending_money, :interests
  attr_writer :spending_money
  def initialize(name,spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end
  def add_interest(exhibit_name)
    @interests << exhibit_name
  end
end