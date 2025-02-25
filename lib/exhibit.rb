class Exhibit 
  attr_reader

  def initialize(details)
    @name = details[:name]
    @cost = details[:cost]
  end
end