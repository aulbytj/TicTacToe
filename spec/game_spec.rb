require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  describe '#moves?' do
    it ' should return true if there are moves to make on the board' do
      players = %w[Bill stacy]
      game = Game.new(players)
      expect(game.moves?).to eql(true)
    end

    it ' should return true if there are no moves to make on the board' do
      players = %w[Bill stacy]
      game = Game.new(players)
      game.make_move('1')
      game.make_move('2')
      game.make_move('3')
      game.make_move('4')
      game.make_move('5')
      game.make_move('6')
      game.make_move('7')
      game.make_move('8')
      game.make_move('9')
      expect(game.moves?).to eql(false)
    end
  end
end
