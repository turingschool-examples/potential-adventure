class Exhibit
  def initialize(values)
    @name = values[:name]
    @cost = values[:cost]
  end

  def name
    @name
  end

  def cost
    @cost
  end
end