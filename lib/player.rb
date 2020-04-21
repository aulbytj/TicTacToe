class Player
  @@players = []
  @character

  attr_reader :name
  attr_reader :character

  def initialize(name, character)
    begin
      raise 'Not a valid name, must be a string' unless name_is_valid?(name)
      raise 'Name already selected' if @@players.any?(name)
      @name = name
      @character = character
    end
  end

  def self.players
    @@players
  end

  def name_is_valid?(name)
    if name.is_a? String
       true
    else
       false
    end
  end
end


