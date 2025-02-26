require 'pry'
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
    @exhibits.select do |exhibit| 
      patron.interests.include?(exhibit.name)
    end 
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = {}
    binding.pry
    @exhibits.each do |exhibit|
      hash[exhibit] = []
      @patrons.each do |patron|
        binding.pry
        if patron.interests.include?(exhibit.name)
          hash[exhibit] << patron
        end
      end
    end
    hash
  end

  

end 

 