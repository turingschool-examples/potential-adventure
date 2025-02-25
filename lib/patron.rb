class Patron
  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end

  def name
    @name
  end

  def spending_money
    @spending_money
  end

  def spending_money=(amount)
    @spending_money = amount
  end

  def interests
    @interests
  end

  def add_interest(interest)
    @interests << interest
  end
end