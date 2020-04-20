class Player
  attr_reader :name
  attr_writer :name
  def initialize name
    begin
      raise 'Not a vaild name, must be a string' unless name_is_valid?(name)
      @name = name
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

me = Player.new(12)
print me
