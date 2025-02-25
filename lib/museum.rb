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

    def admit(patron)
        @patrons << patron
    end

    def recommend_exhibits(patron) #Selects exhibits based on the patrons interest array.
        @exhibits.select do |exhibit|
            patron.interests.include?(exhibit.name)
        end
    end

    def patrons_by_exhibit_interest #Creates hash by taking each exhibit, and checking which patrons have interest. Interested patrons hash will have exhibits as keys and patrons as values
        interested_patrons = {}
        @exhibits.each do |exhibit|
            interested_patrons[exhibit] = @patrons.select do |patron|
                patron.interests.include?(exhibit.name)
            end
        end
        interested_patrons
    end

    def ticket_lottery_contestants(exhibit)
        @patrons.select do |patron|
            patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost #Checking patron interest and if they don't have enough spending money
        end
    end

    def draw_lottery_winner(exhibit)
        contestants = ticket_lottery_contestants(exhibit)
        if contestants.empty?
            return
            nil
        end
        contestants.sample.name #Using .sample on the contestants declared above, calls name as well to get their name only
    end

    def announce_lottery_winner(exhibit)
        winner = draw_lottery_winner(exhibit)
        if winner
            "#{winner} has won the #{exhibit.name} exhibit lottery" #Inserts the winner of the lotto and the exhibit name
        else
            "No winners for this lottery" #If there are no winners, this will show.
        end
    end
end