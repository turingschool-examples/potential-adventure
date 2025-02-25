class Museum
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def name
    @name
  end

  def exhibits
    @exhibits
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end
end