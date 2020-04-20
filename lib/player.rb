class Player
  @@player = {}
  @@count = 0
  @character
  attr_reader :name
  attr_writer :name
  attr_reader :character
  def initialize name
    begin
      raise 'Not a vaild name, must be a string' unless name_is_valid?(name)
      @name = name
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

