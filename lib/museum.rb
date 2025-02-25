class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name =name
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
    exhibit_interests = Hash.new {|hash, key| hash[key] = []}

    @exhibits.each do |exhibit|
      exhibit_interests[exhibit]
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          exhibit_interests[exhibit] << patron 
        end
      end
    end
    exhibit_interests
  end
end