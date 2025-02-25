class Museum
  attr_reader :name, :exhibits
  def initialize(name, exhibits = [])
    @name = name
    @exhibits = exhibits
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end
end