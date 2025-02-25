class Museum 
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits.each_with_object({}) do |exhibit, result|
      result[exhibit] = patrons.select { |patron| patron.interests.include?(exhibit.name) }
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.select { |patron| patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost }
  end
  
  def draw_lottery_winner(exhibit)
    contestants = ticket_lottery_contestants(exhibit)
    contestants.empty? ? nil : contestants.sample.name
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    winner ? "#{winner} has won the #{exhibit.name} exhibit lottery" : "No winners for this lottery"
  end
end