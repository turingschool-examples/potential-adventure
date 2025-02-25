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
        
        @exhibits.each do |exhibit|
            #binding.pry
            patron.interests.map do |interest|
                if interest == exhibit.name
                    recommended_exhibits << exhibit
                end
            end
        end
        return recommended_exhibits
    end


    def admit(patron)
        @patrons << patron
    end


    def patrons_by_exhibit_interest
        {"Gems and Minerals" => [],
        "Dead Sea Scrolls" => [],
        "IMAX" => []
        }
    end

    def add_patrons_to_hash(patron)
        patrons = patrons_by_exhibit_interest
        if patron.interests.include?("Gems and Minerals")
            #binding.pry
            patrons["Gems and Minerals"] << patron

        end
    end

   

end

