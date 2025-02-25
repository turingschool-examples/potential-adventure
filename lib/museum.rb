
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
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_interest_hash = {}
    @exhibits.each do |exhibit|
      exhibit_interest_hash[exhibit] = @patrons.select do |patron|
       patron.interests.include?(exhibit.name)
     end
    end
    exhibit_interest_hash
  end
end