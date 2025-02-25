class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name, exhibits = [])
    @name = name
    @exhibits = exhibits
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    total_cost = 0
    patron.interests.each do |interest|
      exhibit = @exhibits.find { |exhibit| exhibit.name == interest }
      total_cost += exhibit.cost if exhibit
    end

    if patron.spending_money >= total_cost
       patron.spending_money -= total_cost
      "Admitted to the museum, total cost: $#{total_cost}"
    else
      "Not enough money to admit to the museum"
    end
  end  
end