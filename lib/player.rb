class Player
  @@player = {}
  @@player_count = 0
  attr_reader :name
  attr_writer :name
  def initialize name 
    begin
      raise 'Not a vaild name, must be a string' unless name_is_valid?(name)
      @name = name
      @@player_count += 1
    end
  end

  def name_is_valid?(name)
    if name.is_a? String
       true
    else
       false
    end
  end

  def assign_player_character
    if name_is_valid? && player_count == 1
      @@player[name] = 'X'
    elsif name_is_valid? && player_count == 2
      @@player[name] = 'O'
    end
  end
end



me = Player.new(12)
print me
