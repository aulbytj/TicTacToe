class Player
  @@players = []
  @@count = 0

  @character

  attr_reader :name
  attr_writer :name
  attr_reader :character
  attr_reader :players

  def initialize(name)
    begin
      raise 'Not a valid name, must be a string' unless name_is_valid?(name)
      raise 'Name already selected' if @@players.any?(name)
      @name = name
      @@players << name
      @@count += 1
      if @@count == 1
        @character = 'X'
      else
        @character = 'O'
      end
    end
  end

  def name_is_valid?(name)
    if name.is_a? String
       true
    else
       false
    end
  end
end



me = Player.new("jay")
you = Player.new('stacy')

print me.character
print you.character

