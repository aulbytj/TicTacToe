class Player
  attr_reader :name, :symbol
  attr_writer :name, :symbol
  def initialize name, symbol
    @name = name
    @symbol = symbol
  end
end


