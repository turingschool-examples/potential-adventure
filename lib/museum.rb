class Museum
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def name
    @name
  end

  def exhibits
    @exhibits
  end

  def patrons
    @patrons
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
    @patrons << patron # shovel the patrons into the array
  end

  def patrons_by_exhibit_interest
    result = Hash.new { |hash, key| hash[key] = [] } # make a new hash with a default value of an empty array
    @exhibits.each do |exhibit| # iterate over the exhibits
      @patrons.each do |patron| # iterate over the iteration of the exhibits lol
        if patron.interests.include?(exhibit.name) # if the patron's interests include the exhibit name
          result[exhibit] << patron # shovel the patron into the hash with the exhibit as the key
        end
      end
    end
    result
  end

  def ticket_lottery_contestants(exhibit) 
    @patrons.select do |patron| # select the patrons
      patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost # if broke and interested in exhibit 
    end
  end

  def draw_lottery_winner(exhibit) 
    contestants = ticket_lottery_contestants(exhibit)
    return nil if contestants.empty?
    contestants.sample.name
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit) # draw the winner
    if winner
      "#{winner} has won the #{exhibit.name} exhibit lottery" # simple string interpolation
    else
      "No winners for this lottery"
    end
  end
end