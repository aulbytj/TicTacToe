require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  let(:players) { %w[Bill stacy] }
  let(:game) { Game.new(players) }

  describe '#moves?' do
    it ' should return true if there are moves to make on the board' do
      expect(game.moves?).to eql(true)
    end

    it ' should return false if there are no moves to make on the board' do
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

  describe '#board' do
    it 'should return the game board' do
      expect(game.board).to eql("| 1 | 2 | 3 | \n| 4 | 5 | 6 | \n| 7 | 8 | 9 | \n")
    end
  end

  describe '#switch_player' do
    it 'should return the index of the second player: 1' do
      expect(game.switch_player).to eql(1)
    end
  end

  describe '#player' do
    it 'should return the current player' do
      expect(game.player.name).to eql(players[0])
    end
  end
end
