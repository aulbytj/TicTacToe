require_relative '../../lib/board'

describe Board do
  describe '#cell_available?' do
    it 'should return true' do
      board = Board.new
      expect(board.cell_available?('1')).to eql(true)
    end
  end

  describe '#draw' do
    it 'should return string' do
      board = Board.new
      expect(board.draw).to eql("| 1 | 2 | 3 | \n| 4 | 5 | 6 | \n| 7 | 8 | 9 | \n")
    end
  end

  describe '#move' do
    it 'should return 0' do
      board = Board.new
      expect(board.move('1', 'X')).to eql(0)
    end

    it 'should return -1' do
      board = Board.new
      expect(board.move('0', 'X')).to eql(-1)
    end

    it 'should return -2' do
      board = Board.new
      board.moves = 9
      expect(board.move('5', 'X')).to eql(-2)
    end
  end
end
