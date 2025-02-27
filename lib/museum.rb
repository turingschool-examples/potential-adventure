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
        recommended_exhibits = []
        
        @exhibits.each do |exhibit| #iterate over exhibits first because it is a larger array than interests
            patron.interests.map do |interest|
                if interest == exhibit.name
                    recommended_exhibits << exhibit
                end
            end
        end
        return recommended_exhibits
    end

    # def recommend_exhibits(patron)
    #     result = []
    #     @exhibits.each do |exhibit|
    #         if patron.interests.include?(exhibit.name)
    #             result << exhibit
    #         end
    #     end
    #     result
    # end

    # def recommend_exhibits(patron)
    #     @exhibits.find_all do |exhibit|
    #         patron.interests.include?(exhibit.name)
    #     end
    # end


    def admit(patron)
        @patrons << patron
        #@patrons.push(patron) this does the same thing
    end



    def patrons_by_exhibit_interest #creates a hash
        result = {}

        @exhibits.each do |exhibit|
            result[exhibit] = []
        end

        @patrons.each do |patron|
            recommend_exhibits(patron).each do |exhibit|
                result[exhibit] << patron
        #binding.pry
            end
        end
        result
    end


    def ticket_lottery_contestants(exhibit)
        lottery_patrons = patrons_by_exhibit_interest[exhibit]

        lottery_patrons.find_all do |patron|
            patron.spending_money < exhibit.cost
        end
    end

    def draw_lottery_winner(exhibit)
        contestants = ticket_lottery_contestants(exhibit)

        return nil if contestants.empty?
        winner = contestants.sample
        winner.name
    end

    def announce_lottery_winner
        result = draw_lottery_winner(exhibit)
        default = "no winners for this lottery"
        return default if result.nil?
        "#{refult} has won the #{exhibit.name} exhibit lottery"
    end

   
   

end

