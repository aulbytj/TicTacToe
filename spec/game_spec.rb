require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  describe '#moves?' do
    it ' should return true' do
      players = [Player.new('Bill', 'X'), Player.new('stacy', 'O')]
      game = Game.new(players)
      expect(game.moves?).to eql(true)
    end
  end
end
