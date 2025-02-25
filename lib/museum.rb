class Museum
    attr_reader :name, :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron) #Selects exhibits based on the patrons interest array.
        @exhibits.select do |exhibit|
            patron.interests.include?(exhibit.name)
        end
    end
end