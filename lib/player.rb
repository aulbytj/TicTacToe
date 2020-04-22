class Player
  attr_reader :name
  attr_reader :character

  def initialize(name, character)
    @name = name.capitalize
    @character = character
  end
end
