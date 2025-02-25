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

    def patrons_by_exhibit_interest
        interested_patrons = {}
        @exhibits.each do |exhibit|
            interested_patrons[exhibit] = @patrons.select do |patron|
                patron.interests.include?(exhibit.name)
            end
        end
        interested_patrons
    end
end