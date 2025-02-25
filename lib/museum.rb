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
    def recommend_exhibit(patron)
        recommended_exhibits = []
        @exhibits.each do |exhibit|
          if patron.interests.include?(exhibit.name)
            recommended_exhibits << exhibit
          end
        end
        recommended_exhibits
    end
    def admit(patron)
        @patrons << patron
    end
    def patrons_by_exhibit_interest
        exhibit_patron_intrest = {}
        @exhibits.each do |exhibit|
            exhibit_patron_intrest[exhibit] = @patrons.select do |patron|
                patron.interests.include?(exhibit.name)
            end
        end
        exhibit_patron_intrest
    end
    def ticket_lottery_contestants(exhibit)
        loto_contestants = []
        @patron.each do |patron|
            
        end
    end
end