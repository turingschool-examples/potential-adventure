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
        @patrons.each do |patrons|
            recommend_exhibits(patrons).each do |exhibit|
                binding.pry
                result[exhibit] << patrons #at the key of recommended exhibit shovel in the patron to the array
            end
        end
        result
    end


    

end

