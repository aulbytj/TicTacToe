require_relative('player')
require_relative('board')

class Game
  public

  def moves?
    @board.moves?
  end

  def board
    @board.draw
  end

  def make_move(number)
    result = @board.move(number, player.character)
    switch_player if result.zero?
    result
  end

  def switch_player
    @current_player = @current_player == 1 ? 0 : 1
  end

  def player
    @players[@current_player]
  end

  def initialize(players)
    @players = []
    @current_player = 0
    players(players)
    create_board
  end

  private

  def players(players)
    players.each do |player|
      @players << Player.new(player, character)
    end
  end

  def character
    @players.length == 1 ? 'O' : 'X'
  end

  def create_board
    @board = Board.new
  end
end
